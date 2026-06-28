import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item_entity.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required int id,
    required int quantity,
    @JsonKey(name: 'product_id') required int productId,
    required CartProductModel products,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}

@freezed
abstract class CartProductModel with _$CartProductModel {
  const factory CartProductModel({
    required int id,
    required String name,
    required double price,
    @JsonKey(name: 'image_url') String? imageUrl,
    required int stock,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _CartProductModel;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
}

extension CartItemModelX on CartItemModel {
  CartItemEntity toEntity() => CartItemEntity(
    id: id,
    productId: productId,
    productName: products.name,
    productPrice: products.price,
    productImageUrl: products.imageUrl,
    stock: products.stock,
    isActive: products.isActive,
    quantity: quantity,
  );
}
