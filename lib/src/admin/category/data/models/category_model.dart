import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';

class CategoryModel {
  final int id;
  final String name;
  final String? iconUrl;
  final DateTime createdAt;

  const CategoryModel({
    required this.id,
    required this.name,
    this.iconUrl,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      iconUrl: json['icon_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon_url': iconUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      iconUrl: iconUrl,
      createdAt: createdAt,
    );
  }
}