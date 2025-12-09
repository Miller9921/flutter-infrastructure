import '../../models/product_model.dart';

/// Mock product data for testing and development
/// 
/// This list contains realistic product data that can be used
/// for testing data sources and repositories.
final List<ProductModel> mockProducts = [
  ProductModel(
    id: '1',
    name: 'Laptop Pro 15',
    description:
        'High-performance laptop with 15-inch display, Intel i7 processor, '
        '16GB RAM, and 512GB SSD. Perfect for developers and content creators.',
    price: 1299.99,
    category: 'Electronics',
    imageUrl: 'https://example.com/images/laptop-pro-15.jpg',
    stockQuantity: 45,
    isActive: true,
    createdAt: DateTime(2024, 1, 15, 10, 30),
    updatedAt: DateTime(2024, 11, 20, 14, 45),
  ),
  ProductModel(
    id: '2',
    name: 'Wireless Mouse X200',
    description:
        'Ergonomic wireless mouse with precision tracking, 6 programmable '
        'buttons, and long-lasting battery. Compatible with all operating systems.',
    price: 29.99,
    category: 'Electronics',
    imageUrl: 'https://example.com/images/wireless-mouse-x200.jpg',
    stockQuantity: 150,
    isActive: true,
    createdAt: DateTime(2024, 2, 10, 8, 15),
    updatedAt: DateTime(2024, 12, 1, 9, 20),
  ),
  ProductModel(
    id: '3',
    name: 'Coffee Maker Deluxe',
    description:
        'Programmable coffee maker with 12-cup capacity, built-in grinder, '
        'and thermal carafe. Start your day with fresh coffee.',
    price: 89.99,
    category: 'Home & Kitchen',
    imageUrl: 'https://example.com/images/coffee-maker-deluxe.jpg',
    stockQuantity: 78,
    isActive: true,
    createdAt: DateTime(2024, 3, 5, 11, 0),
    updatedAt: DateTime(2024, 11, 15, 16, 30),
  ),
  ProductModel(
    id: '4',
    name: 'Running Shoes Pro',
    description:
        'Lightweight running shoes with advanced cushioning technology, '
        'breathable mesh upper, and durable rubber outsole.',
    price: 124.99,
    category: 'Sports & Outdoors',
    imageUrl: 'https://example.com/images/running-shoes-pro.jpg',
    stockQuantity: 200,
    isActive: true,
    createdAt: DateTime(2024, 1, 20, 9, 45),
    updatedAt: DateTime(2024, 11, 28, 10, 15),
  ),
  ProductModel(
    id: '5',
    name: 'Desk Lamp LED',
    description:
        'Adjustable LED desk lamp with touch controls, multiple brightness '
        'levels, and USB charging port. Perfect for studying or working.',
    price: 39.99,
    category: 'Home & Office',
    imageUrl: 'https://example.com/images/desk-lamp-led.jpg',
    stockQuantity: 95,
    isActive: true,
    createdAt: DateTime(2024, 4, 12, 14, 20),
    updatedAt: DateTime(2024, 12, 5, 11, 0),
  ),
  ProductModel(
    id: '6',
    name: 'Bluetooth Headphones',
    description:
        'Premium wireless headphones with active noise cancellation, '
        '30-hour battery life, and superior sound quality.',
    price: 199.99,
    category: 'Electronics',
    imageUrl: 'https://example.com/images/bluetooth-headphones.jpg',
    stockQuantity: 62,
    isActive: true,
    createdAt: DateTime(2024, 2, 28, 10, 10),
    updatedAt: DateTime(2024, 11, 22, 15, 40),
  ),
  ProductModel(
    id: '7',
    name: 'Yoga Mat Premium',
    description:
        'Extra-thick yoga mat with non-slip surface, eco-friendly materials, '
        'and carrying strap. Ideal for all types of yoga and exercises.',
    price: 34.99,
    category: 'Sports & Outdoors',
    imageUrl: 'https://example.com/images/yoga-mat-premium.jpg',
    stockQuantity: 180,
    isActive: true,
    createdAt: DateTime(2024, 3, 15, 8, 30),
    updatedAt: DateTime(2024, 12, 3, 9, 50),
  ),
  ProductModel(
    id: '8',
    name: 'Blender Pro 3000',
    description:
        'Professional-grade blender with powerful motor, multiple speed '
        'settings, and dishwasher-safe parts. Perfect for smoothies and more.',
    price: 149.99,
    category: 'Home & Kitchen',
    imageUrl: 'https://example.com/images/blender-pro-3000.jpg',
    stockQuantity: 55,
    isActive: true,
    createdAt: DateTime(2024, 5, 8, 13, 45),
    updatedAt: DateTime(2024, 11, 30, 14, 10),
  ),
  ProductModel(
    id: '9',
    name: 'Backpack Travel',
    description:
        'Durable travel backpack with laptop compartment, water-resistant '
        'fabric, and multiple pockets. TSA-approved for carry-on.',
    price: 79.99,
    category: 'Travel & Luggage',
    imageUrl: 'https://example.com/images/backpack-travel.jpg',
    stockQuantity: 120,
    isActive: true,
    createdAt: DateTime(2024, 4, 22, 11, 15),
    updatedAt: DateTime(2024, 12, 4, 10, 25),
  ),
  ProductModel(
    id: '10',
    name: 'Smart Watch Series 5',
    description:
        'Feature-packed smartwatch with fitness tracking, heart rate monitor, '
        'GPS, and smartphone notifications. Water-resistant up to 50 meters.',
    price: 249.99,
    category: 'Electronics',
    imageUrl: 'https://example.com/images/smart-watch-series-5.jpg',
    stockQuantity: 88,
    isActive: true,
    createdAt: DateTime(2024, 1, 10, 9, 0),
    updatedAt: DateTime(2024, 12, 2, 16, 20),
  ),
];
