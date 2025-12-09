import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

/// Product model for JSON serialization/deserialization
///
/// This model represents a product from the API and includes methods
/// for converting to/from JSON and domain entities.
@JsonSerializable()
class ProductModel {
  /// Unique identifier for the product
  @JsonKey(name: 'id')
  final String id;

  /// Product name
  @JsonKey(name: 'name')
  final String name;

  /// Product description
  @JsonKey(name: 'description')
  final String description;

  /// Product price
  @JsonKey(name: 'price')
  final double price;

  /// Product category
  @JsonKey(name: 'category')
  final String category;

  /// URL to product image
  @JsonKey(name: 'image_url')
  final String imageUrl;

  /// Available stock quantity
  @JsonKey(name: 'stock_quantity')
  final int stockQuantity;

  /// Whether the product is active/available
  @JsonKey(name: 'is_active')
  final bool isActive;

  /// Date when product was created
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Date when product was last updated
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.stockQuantity,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Creates a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Converts ProductModel to JSON
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  // TODO: Implement toEntity() method
  // Converts this model to a domain Product entity
  // Requires importing domain package:
  // Product toEntity() {
  //   return Product(
  //     id: id,
  //     name: name,
  //     description: description,
  //     price: price,
  //     category: category,
  //     imageUrl: imageUrl,
  //     stockQuantity: stockQuantity,
  //     isActive: isActive,
  //     createdAt: createdAt,
  //     updatedAt: updatedAt,
  //   );
  // }

  // TODO: Implement fromEntity() factory method
  // Creates a ProductModel from a domain Product entity
  // Requires importing domain package:
  // factory ProductModel.fromEntity(Product entity) {
  //   return ProductModel(
  //     id: entity.id,
  //     name: entity.name,
  //     description: entity.description,
  //     price: entity.price,
  //     category: entity.category,
  //     imageUrl: entity.imageUrl,
  //     stockQuantity: entity.stockQuantity,
  //     isActive: entity.isActive,
  //     createdAt: entity.createdAt,
  //     updatedAt: entity.updatedAt,
  //   );
  // }
}
