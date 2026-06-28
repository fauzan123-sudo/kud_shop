// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productPrice: (json['product_price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      subtotal: (json['subtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
    };

_OrderAddressModel _$OrderAddressModelFromJson(Map<String, dynamic> json) =>
    _OrderAddressModel(
      recipientName: json['recipient_name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$OrderAddressModelToJson(_OrderAddressModel instance) =>
    <String, dynamic>{
      'recipient_name': instance.recipientName,
      'phone': instance.phone,
      'address': instance.address,
    };

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: (json['id'] as num).toInt(),
  totalPrice: (json['total_price'] as num).toDouble(),
  deliveryMethod: json['delivery_method'] as String,
  paymentMethod: json['payment_method'] as String,
  paymentProofUrl: json['payment_proof_url'] as String?,
  status: json['status'] as String,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  addresses: json['addresses'] == null
      ? null
      : OrderAddressModel.fromJson(json['addresses'] as Map<String, dynamic>),
  orderItems: (json['order_items'] as List<dynamic>)
      .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_price': instance.totalPrice,
      'delivery_method': instance.deliveryMethod,
      'payment_method': instance.paymentMethod,
      'payment_proof_url': instance.paymentProofUrl,
      'status': instance.status,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'addresses': instance.addresses,
      'order_items': instance.orderItems,
    };
