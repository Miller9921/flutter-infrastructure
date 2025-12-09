import '../models/product_model.dart';

/// Abstract interface for remote product data operations
abstract class ProductRemoteDataSource {
  /// Fetches all products from the remote API
  /// 
  /// Returns a list of all available products.
  /// Throws an exception if the request fails.
  Future<List<ProductModel>> fetchAllProducts();

  /// Fetches a single product by ID from the remote API
  /// 
  /// Returns the product if found, null otherwise.
  /// Throws an exception if the request fails.
  Future<ProductModel?> fetchProductById(String id);

  /// Searches for products matching the query
  /// 
  /// Returns a list of products that match the search criteria.
  /// Throws an exception if the request fails.
  Future<List<ProductModel>> searchProducts(String query);
}

/// Mock implementation of ProductRemoteDataSource for testing
/// 
/// This implementation simulates API calls with mock data and delays.
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final List<ProductModel> _mockProducts;

  ProductRemoteDataSourceImpl({List<ProductModel>? mockProducts})
      : _mockProducts = mockProducts ?? [];

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts;
  }

  @override
  Future<ProductModel?> fetchProductById(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    try {
      return _mockProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));
    
    final lowerQuery = query.toLowerCase();
    return _mockProducts.where((product) {
      return product.name.toLowerCase().contains(lowerQuery) ||
          product.description.toLowerCase().contains(lowerQuery) ||
          product.category.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
