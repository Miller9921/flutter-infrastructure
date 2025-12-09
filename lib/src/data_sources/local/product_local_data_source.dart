import '../models/product_model.dart';

/// Abstract interface for local product data operations
abstract class ProductLocalDataSource {
  /// Retrieves all cached products
  Future<List<ProductModel>> getCachedProducts();

  /// Retrieves a single cached product by ID
  Future<ProductModel?> getCachedProductById(String id);

  /// Caches a list of products
  Future<void> cacheProducts(List<ProductModel> products);

  /// Caches a single product
  Future<void> cacheProduct(ProductModel product);

  /// Clears all cached products
  Future<void> clearCache();
}

/// In-memory implementation of ProductLocalDataSource
/// 
/// This implementation stores products in memory for simple caching.
/// Data is lost when the application restarts.
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Map<String, ProductModel> _cache = {};

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return _cache.values.toList();
  }

  @override
  Future<ProductModel?> getCachedProductById(String id) async {
    return _cache[id];
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    for (final product in products) {
      _cache[product.id] = product;
    }
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    _cache[product.id] = product;
  }

  @override
  Future<void> clearCache() async {
    _cache.clear();
  }
}
