import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

@freezed
abstract class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required int id,
    required int productId,
    required String productName,
    required double productPrice,
    required int quantity,
    required double subtotal,
  }) = _OrderItemEntity;
}

@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required int id,
    required double totalPrice,
    required String deliveryMethod,
    required String paymentMethod,
    String? paymentProofUrl,
    required String status,
    String? notes,
    required DateTime createdAt,
    required String recipientName,
    required String recipientPhone,
    String? recipientAddress,
    required List<OrderItemEntity> items,
  }) = _OrderEntity;

  const OrderEntity._();

  bool get isPending => status == 'pending';
  bool get isConfirmed => status == 'confirmed';
  bool get isProcessing => status == 'processing';
  bool get isDelivered => status == 'delivered';
  bool get isCancelled => status == 'cancelled';

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
