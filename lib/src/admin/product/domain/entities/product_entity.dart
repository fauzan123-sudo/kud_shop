import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductEntity;

  const ProductEntity._();

  bool get isAvailable => isActive && stock > 0;
  bool get isLowStock => stock > 0 && stock <= 10;
  bool get isOutOfStock => stock <= 0;
}