import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item_entity.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState.initial() = CartInitial;
  const factory CartState.loading() = CartLoading;
  const factory CartState.loaded(
    List<CartItemEntity> items, {
    @Default(<int>{}) Set<int> selectedIds,
  }) = CartLoaded;
  const factory CartState.error(String message) = CartError;
}

extension CartLoadedX on CartLoaded {
  bool get isEmpty => items.isEmpty;
  bool get isAllSelected =>
      items.isNotEmpty && selectedIds.length == items.length;

  List<CartItemEntity> get selectedItems =>
      items.where((item) => selectedIds.contains(item.id)).toList();

  double get totalPrice =>
      selectedItems.fold(0, (sum, item) => sum + item.subtotal);

  int get totalQuantity =>
      selectedItems.fold(0, (sum, item) => sum + item.quantity);

  CartLoaded copyWithSelected({
    List<CartItemEntity>? items,
    Set<int>? selectedIds,
  }) {
    return CartLoaded(
      items ?? this.items,
      selectedIds: selectedIds ?? this.selectedIds,
    );
  }
}