import 'package:flutter/material.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AdminOrderDataSource {
  Future<List<OrderEntity>> getAllOrders();
  Future<OrderEntity> updateOrderStatus({
    required int orderId,
    required String status,
  });
}

class AdminOrderDataSourceImpl implements AdminOrderDataSource {
  final SupabaseClient supabase;

  AdminOrderDataSourceImpl(this.supabase);

  static const _orderSelect = '''
    id,
    total_price,
    delivery_method,
    payment_method,
    payment_proof_url,
    status,
    notes,
    created_at,
    addresses ( recipient_name, phone, address ),
    order_items ( id, product_id, product_name, product_price, quantity, subtotal )
  ''';

  @override
  Future<List<OrderEntity>> getAllOrders() async {
    try {
      final response = await supabase
          .from('orders')
          .select(_orderSelect)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => _fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data pesanan');
    }
  }

  @override
  Future<OrderEntity> updateOrderStatus({
    required int orderId,
    required String status,
  }) async {
    try {
      final response = await supabase
          .from('orders')
          .update({'status': status})
          .eq('id', orderId)
          .select(_orderSelect)
          .single();

      return _fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal mengubah status pesanan');
    }
  }

  OrderEntity _fromJson(Map<String, dynamic> json) {
    final address = json['addresses'] as Map<String, dynamic>?;
    final itemsJson = json['order_items'] as List;
    debugPrint('address data: $address');
    return OrderEntity(
      id: json['id'] as int,
      totalPrice: (json['total_price'] as num).toDouble(),
      deliveryMethod: json['delivery_method'] as String,
      paymentMethod: json['payment_method'] as String,
      paymentProofUrl: json['payment_proof_url'] as String?,
      status: json['status'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      recipientName: address?['recipient_name'] as String? ?? '-',
      recipientPhone: address?['phone'] as String? ?? '-',
      recipientAddress: address?['address'] as String?,
      items: itemsJson.map((item) {
        return OrderItemEntity(
          id: item['id'] as int,
          productId: item['product_id'] as int,
          productName: item['product_name'] as String,
          productPrice: (item['product_price'] as num).toDouble(),
          quantity: item['quantity'] as int,
          subtotal: (item['subtotal'] as num).toDouble(),
        );
      }).toList(),
    );
  }
}
