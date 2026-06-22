class OrderItemEntity {
  final int id;
  final int productId;
  final String productName;
  final double productPrice;
  final int quantity;
  final double subtotal;

  const OrderItemEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.subtotal,
  });
}

class OrderEntity {
  final int id;
  final double totalPrice;
  final String deliveryMethod; // 'pickup' | 'delivery'
  final String paymentMethod; // 'transfer' | 'cod'
  final String? paymentProofUrl;
  final String status; // pending, confirmed, processing, delivered, cancelled
  final String? notes;
  final DateTime createdAt;
  final String recipientName;
  final String recipientPhone;
  final String? recipientAddress;
  final List<OrderItemEntity> items;

  const OrderEntity({
    required this.id,
    required this.totalPrice,
    required this.deliveryMethod,
    required this.paymentMethod,
    this.paymentProofUrl,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.recipientName,
    required this.recipientPhone,
    this.recipientAddress,
    required this.items,
  });

  bool get isPending => status == 'pending';
  bool get isConfirmed => status == 'confirmed';
  bool get isProcessing => status == 'processing';
  bool get isDelivered => status == 'delivered';
  bool get isCancelled => status == 'cancelled';

  /// Label status dalam Bahasa Indonesia untuk ditampilkan ke user.
  String get statusLabel {
    switch (status) {
      case 'pending':
        return 'Menunggu Konfirmasi';
      case 'confirmed':
        return 'Dikonfirmasi';
      case 'processing':
        return 'Diproses';
      case 'delivered':
        return 'Selesai';
      case 'cancelled':
        return 'Dibatalkan';
      default:
        return status;
    }
  }

  String get deliveryMethodLabel =>
      deliveryMethod == 'pickup' ? 'Ambil Sendiri' : 'Diantar';

  String get paymentMethodLabel =>
      paymentMethod == 'transfer' ? 'Transfer Bank' : 'Bayar di Tempat (COD)';
}