import '../../domain/entities/cart_item_entity.dart';

abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final List<CartItemEntity> items;

  const CartLoaded(this.items);

  double get totalPrice => items.fold(0, (sum, item) => sum + item.subtotal);

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);
}
