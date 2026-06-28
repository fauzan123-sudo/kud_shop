import 'dart:typed_data';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import 'package:kud_shop/src/customer/order/data/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/order_entity.dart';

abstract class OrderSupabaseDataSource {
  Future<OrderEntity> createOrder({
    required int addressId,
    required String deliveryMethod,
    required String paymentMethod,
    String? notes,
    bool isBuyNow,
    int? buyNowProductId,
    int? buyNowQuantity,
    List<int> selectedCartItemIds = const [],
    List<CartItemEntity> cartItems = const [],
  });

  Future<List<OrderEntity>> getMyOrders();
  Future<OrderEntity> getOrderById(int id);
  Future<String> uploadPaymentProof({
    required int orderId,
    required List<int> imageBytes,
  });
}

class OrderSupabaseDataSourceImpl implements OrderSupabaseDataSource {
  final SupabaseClient supabase;

  OrderSupabaseDataSourceImpl(this.supabase);

  String get _userId {
    final id = supabase.auth.currentUser?.id;
    if (id == null) throw UnauthorizedException();
    return id;
  }

  @override
  Future<OrderEntity> createOrder({
    required int addressId,
    required String deliveryMethod,
    required String paymentMethod,
    String? notes,
    bool isBuyNow = false,
    int? buyNowProductId,
    int? buyNowQuantity,
    List<int> selectedCartItemIds = const [],
    List<CartItemEntity> cartItems = const [],
  }) async {
    try {
      // 1. Ambil alamat
      final addressData = await supabase
          .from('addresses')
          .select('recipient_name, phone, address')
          .eq('id', addressId)
          .single();

      // 2. Gunakan cartItems dari state atau ambil dari Supabase
      List<Map<String, dynamic>> cartItemsData;
      if (cartItems.isNotEmpty) {
        cartItemsData = cartItems
            .map(
              (item) => {
                'id': item.id,
                'quantity': item.quantity,
                'product_id': item.productId,
                'products': {
                  'id': item.productId,
                  'name': item.productName,
                  'price': item.productPrice,
                  'stock': item.stock,
                },
              },
            )
            .toList();
      } else {
        final cartQuery = supabase
            .from('cart_items')
            .select(
              'id, quantity, product_id, products ( id, name, price, stock )',
            )
            .eq('user_id', _userId);

        final cartResponse = selectedCartItemIds.isNotEmpty
            ? await cartQuery.inFilter('id', selectedCartItemIds)
            : await cartQuery;

        cartItemsData = (cartResponse as List).cast<Map<String, dynamic>>();
      }

      if (cartItemsData.isEmpty) {
        throw ServerException(message: 'Keranjang kosong, tidak bisa checkout');
      }

      // 3. Validasi stok
      for (final item in cartItemsData) {
        final product = item['products'] as Map<String, dynamic>;
        final stock = product['stock'] as int;
        final qty = item['quantity'] as int;
        if (qty > stock) {
          throw ServerException(
            message: 'Stok "${product['name']}" tidak cukup',
          );
        }
      }

      // 4. Hitung total harga
      double totalPrice = 0;
      for (final item in cartItemsData) {
        final product = item['products'] as Map<String, dynamic>;
        final price = (product['price'] as num).toDouble();
        final qty = item['quantity'] as int;
        totalPrice += price * qty;
      }

      // 5. Insert ke tabel orders
      final orderResponse = await supabase
          .from('orders')
          .insert({
            'user_id': _userId,
            'address_id': addressId,
            'total_price': totalPrice,
            'delivery_method': deliveryMethod,
            'payment_method': paymentMethod,
            'status': 'pending',
            'notes': notes,
          })
          .select()
          .single();

      final orderId = orderResponse['id'] as int;

      // 6. Insert order_items
      final orderItemsPayload = cartItemsData.map((item) {
        final product = item['products'] as Map<String, dynamic>;
        final price = (product['price'] as num).toDouble();
        final qty = item['quantity'] as int;
        return {
          'order_id': orderId,
          'product_id': item['product_id'],
          'product_name': product['name'],
          'product_price': price,
          'quantity': qty,
          'subtotal': price * qty,
        };
      }).toList();

      await supabase.from('order_items').insert(orderItemsPayload);

      // 7. Kurangi stok produk
      for (final item in cartItemsData) {
        final product = item['products'] as Map<String, dynamic>;
        final stock = product['stock'] as int;
        final qty = item['quantity'] as int;
        await supabase
            .from('products')
            .update({'stock': stock - qty})
            .eq('id', item['product_id']);
      }

      // 8. Hapus item cart yang dipesan
      if (selectedCartItemIds.isNotEmpty) {
        await supabase
            .from('cart_items')
            .delete()
            .inFilter('id', selectedCartItemIds);
      } else {
        await supabase.from('cart_items').delete().eq('user_id', _userId);
      }

      // 9. Susun OrderEntity
      final orderItems = orderItemsPayload.map((data) {
        return OrderItemEntity(
          id: 0,
          productId: data['product_id'] as int,
          productName: data['product_name'] as String,
          productPrice: data['product_price'] as double,
          quantity: data['quantity'] as int,
          subtotal: data['subtotal'] as double,
        );
      }).toList();

      return OrderEntity(
        id: orderId,
        totalPrice: totalPrice,
        deliveryMethod: deliveryMethod,
        paymentMethod: paymentMethod,
        status: 'pending',
        notes: notes,
        createdAt: DateTime.now(),
        recipientName: addressData['recipient_name'] as String,
        recipientPhone: addressData['phone'] as String,
        recipientAddress: addressData['address'] as String?,
        items: orderItems,
      );
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: 'Gagal membuat pesanan');
    }
  }

  @override
  Future<List<OrderEntity>> getMyOrders() async {
    try {
      final response = await supabase
          .from('orders')
          .select('''
            id, total_price, delivery_method, payment_method,
            payment_proof_url, status, notes, created_at,
            addresses ( recipient_name, phone, address ),
            order_items ( id, product_id, product_name, product_price, quantity, subtotal )
          ''')
          .eq('user_id', _userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => _fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil riwayat pesanan');
    }
  }

  @override
  Future<OrderEntity> getOrderById(int id) async {
    try {
      final response = await supabase
          .from('orders')
          .select('''
            id, total_price, delivery_method, payment_method,
            payment_proof_url, status, notes, created_at,
            addresses ( recipient_name, phone, address ),
            order_items ( id, product_id, product_name, product_price, quantity, subtotal )
          ''')
          .eq('id', id)
          .single();

      return _fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil detail pesanan');
    }
  }

  @override
  Future<String> uploadPaymentProof({
    required int orderId,
    required List<int> imageBytes,
  }) async {
    try {
      final bytes = Uint8List.fromList(imageBytes);
      final fileName =
          'proof_${orderId}_${DateTime.now().millisecondsSinceEpoch}.jpg';

      await supabase.storage
          .from('payment_proofs')
          .uploadBinary(fileName, bytes);

      final url = supabase.storage
          .from('payment_proofs')
          .getPublicUrl(fileName);

      await supabase
          .from('orders')
          .update({'payment_proof_url': url})
          .eq('id', orderId);

      return url;
    } catch (e) {
      throw ServerException(message: 'Gagal mengupload bukti transfer');
    }
  }

  OrderEntity _fromJson(Map<String, dynamic> json) {
    return OrderModel.fromJson(json).toEntity();
  }
}
