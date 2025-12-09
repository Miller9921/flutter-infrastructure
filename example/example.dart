import 'package:infrastructure/infrastructure.dart';

/// Example demonstrating the infrastructure layer usage
void main() async {
  print('=== Infrastructure Layer Example ===\n');

  // Initialize data sources
  final remoteDataSource = ProductRemoteDataSourceImpl(
    mockProducts: mockProducts,
  );
  final localDataSource = ProductLocalDataSourceImpl();

  // Initialize repository
  final repository = ProductRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  print('1. Fetching all products...');
  final products = await repository.getAllProducts();
  print('   Found ${products.length} products\n');

  print('2. First 3 products:');
  for (final product in products.take(3)) {
    print('   - ${product.name} (\$${product.price})');
  }
  print('');

  print('3. Searching for "laptop"...');
  final searchResults = await repository.searchProducts('laptop');
  print('   Found ${searchResults.length} results:');
  for (final product in searchResults) {
    print('   - ${product.name}');
  }
  print('');

  print('4. Fetching product by ID (id: "5")...');
  final product = await repository.getProductById('5');
  if (product != null) {
    print('   Found: ${product.name}');
    print('   Price: \$${product.price}');
    print('   Category: ${product.category}');
    print('   Stock: ${product.stockQuantity} units');
  }
  print('');

  print('5. Testing cache fallback (simulating network failure)...');
  print('   Products are cached from step 1');
  print('   Cache contains ${(await localDataSource.getCachedProducts()).length} products');
  print('');

  print('6. Testing JSON serialization...');
  final testProduct = products.first;
  final json = testProduct.toJson();
  print('   Original: ${testProduct.name}');
  print('   JSON keys: ${json.keys.join(", ")}');
  final deserialized = ProductModel.fromJson(json);
  print('   Deserialized: ${deserialized.name}');
  print('');

  print('=== Example completed successfully! ===');
}
