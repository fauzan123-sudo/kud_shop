import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.freezed.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.load() = CartLoad;
  const factory CartEvent.addItem({
    required int productId,
    @Default(1) int quantity,
  }) = CartAddItem;
  const factory CartEvent.updateQuantity({
    required int cartItemId,
    required int quantity,
  }) = CartUpdateQuantity;
  const factory CartEvent.removeItem({required int cartItemId}) = CartRemoveItem;
  const factory CartEvent.toggleSelect({required int cartItemId}) = CartToggleSelect;
  const factory CartEvent.selectAll({required bool selectAll}) = CartSelectAll;
}