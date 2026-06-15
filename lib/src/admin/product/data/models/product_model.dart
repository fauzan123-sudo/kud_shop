import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

class ProductModel {
  final int id;
  final int? categoryId;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String? imageUrl;
  final String unit;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductModel({
    required this.id,
    this.categoryId,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    this.imageUrl,
    required this.unit,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      categoryId: json['category_id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      imageUrl: json['image_url'] as String?,
      unit: json['unit'] as String,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'image_url': imageUrl,
      'unit': unit,
      'is_active': isActive,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      price: price,
      stock: stock,
      imageUrl: imageUrl,
      unit: unit,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
