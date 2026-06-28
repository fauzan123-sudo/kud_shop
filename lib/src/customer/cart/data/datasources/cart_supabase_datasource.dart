import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/customer/cart/data/models/cart_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/cart_item_entity.dart';

abstract class CartSupabaseDataSource {
  Future<List<CartItemEntity>> getCartItems();
  Future<void> addToCart({required int productId, required int quantity});
  Future<void> updateQuantity({required int cartItemId, required int quantity});
  Future<void> removeFromCart({required int cartItemId});
  Future<void> clearCart();
}

class CartSupabaseDataSourceImpl implements CartSupabaseDataSource {
  final SupabaseClient supabase;

  CartSupabaseDataSourceImpl(this.supabase);

  String get _userId {
    final id = supabase.auth.currentUser?.id;
    if (id == null) throw UnauthorizedException();
    return id;
  }

  @override
  Future<List<CartItemEntity>> getCartItems() async {
    try {
      final response = await supabase
          .from('cart_items')
          .select('''
            id,
            quantity,
            product_id,
            products (
              id,
              name,
              price,
              image_url,
              stock,
              is_active
            )
          ''')
          .eq('user_id', _userId)
          .order('created_at', ascending: false);

      return (response as List).map((json) {
        return CartItemModel.fromJson(json as Map<String, dynamic>).toEntity();
      }).toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data keranjang');
    }
  }

  @override
  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      // Ambil stok produk dulu
      final productData = await supabase
          .from('products')
          .select('stock')
          .eq('id', productId)
          .single();
      final stock = productData['stock'] as int;

      // Cek apakah produk sudah ada di cart user ini
      final existing = await supabase
          .from('cart_items')
          .select('id, quantity')
          .eq('user_id', _userId)
          .eq('product_id', productId)
          .maybeSingle();

      if (existing != null) {
        // Sudah ada → tambahkan quantity tapi jangan melebihi stok
        final currentQty = existing['quantity'] as int;
        final newQty = (currentQty + quantity).clamp(1, stock);
        await supabase
            .from('cart_items')
            .update({'quantity': newQty})
            .eq('id', existing['id']);
      } else {
        // Belum ada → insert baru, quantity tidak boleh melebihi stok
        final safeQty = quantity.clamp(1, stock);
        await supabase.from('cart_items').insert({
          'user_id': _userId,
          'product_id': productId,
          'quantity': safeQty,
        });
      }
    } catch (e) {
      throw ServerException(message: 'Gagal menambah ke keranjang');
    }
  }

  @override
  Future<void> updateQuantity({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      await supabase
          .from('cart_items')
          .update({'quantity': quantity})
          .eq('id', cartItemId);
    } catch (e) {
      throw ServerException(message: 'Gagal mengubah jumlah');
    }
  }

  @override
  Future<void> removeFromCart({required int cartItemId}) async {
    try {
      await supabase.from('cart_items').delete().eq('id', cartItemId);
    } catch (e) {
      throw ServerException(message: 'Gagal menghapus item');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await supabase.from('cart_items').delete().eq('user_id', _userId);
    } catch (e) {
      throw ServerException(message: 'Gagal mengosongkan keranjang');
    }
  }
}
