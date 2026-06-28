import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_entity.freezed.dart';

@freezed
abstract class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required int id,
    required int productId,
    required String productName,
    required double productPrice,
    String? productImageUrl,
    required int stock,
    required bool isActive,
    required int quantity,
  }) = _CartItemEntity;

  const CartItemEntity._();

  double get subtotal => productPrice * quantity;
  bool get isOutOfStock => stock <= 0;
  bool get exceedsStock => quantity > stock;
}