import 'package:infrastructure/src/data_sources/local/product_local_data_source.dart';
import 'package:infrastructure/src/data_sources/remote/product_remote_data_source.dart';
import 'package:infrastructure/src/models/product_model.dart';

// TODO: Import domain package to implement ProductRepository interface
// import 'package:domain/domain.dart';

/// Implementation of ProductRepository
///
/// This repository coordinates between remote and local data sources,
/// implementing a cache-first strategy with network fallback.
///
/// TODO: Implement ProductRepository interface from domain package
class ProductRepositoryImpl {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  /// Fetches all products
  ///
  /// First tries to fetch from remote source and caches the result.
  /// If remote fetch fails, returns cached products.
  ///
  /// TODO: Return Either<Failure, List<Product>> from dartz
  Future<List<ProductModel>> getAllProducts() async {
    Object? remoteError;
    try {
      // Try to fetch from remote source
      final remoteProducts = await remoteDataSource.fetchAllProducts();

      // Cache the fetched products
      await localDataSource.cacheProducts(remoteProducts);

      return remoteProducts;
    } catch (e) {
      remoteError = e;
    }

    // If remote fetch fails, try to get cached products
    try {
      final cachedProducts = await localDataSource.getCachedProducts();
      if (cachedProducts.isNotEmpty) {
        return cachedProducts;
      }
    } catch (cacheError) {
      // Ignore cache error and throw the original remote error
    }

    // Throw the original remote error
    Error.throwWithStackTrace(remoteError, StackTrace.current);
  }

  /// Fetches a product by ID
  ///
  /// First tries to fetch from remote source and caches the result.
  /// If remote fetch fails, returns cached product.
  ///
  /// TODO: Return Either<Failure, Product?> from dartz
  Future<ProductModel?> getProductById(String id) async {
    Object? remoteError;
    try {
      // Try to fetch from remote source
      final remoteProduct = await remoteDataSource.fetchProductById(id);

      if (remoteProduct != null) {
        // Cache the fetched product
        await localDataSource.cacheProduct(remoteProduct);
      }

      return remoteProduct;
    } catch (e) {
      remoteError = e;
    }

    // If remote fetch fails, try to get cached product
    try {
      final cachedProduct = await localDataSource.getCachedProductById(id);
      if (cachedProduct != null) {
        return cachedProduct;
      }
    } catch (cacheError) {
      // Ignore cache error and throw the original remote error
    }

    // Throw the original remote error
    Error.throwWithStackTrace(remoteError, StackTrace.current);
  }

  /// Searches for products matching the query
  ///
  /// Performs search on remote source only (no caching for search results).
  ///
  /// TODO: Return Either<Failure, List<Product>> from dartz
  Future<List<ProductModel>> searchProducts(String query) async {
    // Search is performed on remote source only
    return await remoteDataSource.searchProducts(query);
  }

  /// Clears all cached products
  Future<void> clearCache() async {
    await localDataSource.clearCache();
  }

  // TODO: Add methods to convert ProductModel to/from Product entity
  // These methods will be needed when implementing the domain repository
  // interface:
  //
  // List<Product> _modelsToEntities(List<ProductModel> models) {
  //   return models.map((model) => model.toEntity()).toList();
  // }
  //
  // Product _modelToEntity(ProductModel model) {
  //   return model.toEntity();
  // }
  //
  // ProductModel _entityToModel(Product entity) {
  //   return ProductModel.fromEntity(entity);
  // }
}
