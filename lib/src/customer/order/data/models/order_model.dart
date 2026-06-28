import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required int id,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_price') required double productPrice,
    required int quantity,
    required double subtotal,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@freezed
abstract class OrderAddressModel with _$OrderAddressModel {
  const factory OrderAddressModel({
    @JsonKey(name: 'recipient_name') required String recipientName,
    required String phone,
    String? address,
  }) = _OrderAddressModel;

  factory OrderAddressModel.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressModelFromJson(json);
}

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'delivery_method') required String deliveryMethod,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'payment_proof_url') String? paymentProofUrl,
    required String status,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required OrderAddressModel? addresses,
    @JsonKey(name: 'order_items') required List<OrderItemModel> orderItems,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

extension OrderItemModelX on OrderItemModel {
  OrderItemEntity toEntity() => OrderItemEntity(
        id: id,
        productId: productId,
        productName: productName,
        productPrice: productPrice,
        quantity: quantity,
        subtotal: subtotal,
      );
}

extension OrderModelX on OrderModel {
  OrderEntity toEntity() => OrderEntity(
        id: id,
        totalPrice: totalPrice,
        deliveryMethod: deliveryMethod,
        paymentMethod: paymentMethod,
        paymentProofUrl: paymentProofUrl,
        status: status,
        notes: notes,
        createdAt: createdAt,
        recipientName: addresses?.recipientName ?? '-',
        recipientPhone: addresses?.phone ?? '-',
        recipientAddress: addresses?.address,
        items: orderItems.map((e) => e.toEntity()).toList(),
      );
}