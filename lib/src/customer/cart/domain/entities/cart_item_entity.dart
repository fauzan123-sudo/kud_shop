class CartItemEntity {
  final int id;
  final int productId;
  final String productName;
  final double productPrice;
  final String? productImageUrl;
  final int stock;
  final bool isActive;
  final int quantity;

  const CartItemEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    this.productImageUrl,
    required this.stock,
    required this.isActive,
    required this.quantity,
  });

  double get subtotal => productPrice * quantity;
  bool get isOutOfStock => stock <= 0;
  bool get exceedsStock => quantity > stock;

  CartItemEntity copyWith({
    int? id,
    int? productId,
    String? productName,
    double? productPrice,
    String? productImageUrl,
    int? stock,
    bool? isActive,
    int? quantity,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productImageUrl: productImageUrl ?? this.productImageUrl,
      stock: stock ?? this.stock,
      isActive: isActive ?? this.isActive,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItemEntity &&
        other.id == id &&
        other.productId == productId &&
        other.productName == productName &&
        other.productPrice == productPrice &&
        other.productImageUrl == productImageUrl &&
        other.stock == stock &&
        other.isActive == isActive &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    productName,
    productPrice,
    productImageUrl,
    stock,
    isActive,
    quantity,
  );
}
