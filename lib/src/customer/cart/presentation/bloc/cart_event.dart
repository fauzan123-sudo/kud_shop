abstract class CartEvent {
  const CartEvent();
}

class CartLoad extends CartEvent {
  const CartLoad();
}

class CartAddItem extends CartEvent {
  final int productId;
  final int quantity;

  const CartAddItem({required this.productId, this.quantity = 1});
}

class CartUpdateQuantity extends CartEvent {
  final int cartItemId;
  final int quantity;

  const CartUpdateQuantity({required this.cartItemId, required this.quantity});
}

class CartRemoveItem extends CartEvent {
  final int cartItemId;

  const CartRemoveItem({required this.cartItemId});
}