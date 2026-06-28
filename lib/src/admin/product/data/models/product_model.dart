import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    @JsonKey(name: 'category_id') int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String unit,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  ProductEntity toEntity() => ProductEntity(
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

  Map<String, dynamic> toInsertJson() => {
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