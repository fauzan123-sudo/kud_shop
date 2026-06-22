import 'package:kud_shop/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/address_entity.dart';

abstract class AddressSupabaseDataSource {
  Future<List<AddressEntity>> getAddresses();
  Future<AddressEntity> createAddress({
    required String recipientName,
    required String phone,
    required String address,
    required bool isDefault,
  });
  Future<AddressEntity> updateAddress({
    required int id,
    required String recipientName,
    required String phone,
    required String address,
  });
  Future<void> deleteAddress({required int id});
  Future<void> setDefaultAddress({required int id});
}

class AddressSupabaseDataSourceImpl implements AddressSupabaseDataSource {
  final SupabaseClient supabase;

  AddressSupabaseDataSourceImpl(this.supabase);

  String get _userId {
    final id = supabase.auth.currentUser?.id;
    if (id == null) throw UnauthorizedException();
    return id;
  }

  AddressEntity _fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      id: json['id'] as int,
      recipientName: json['recipient_name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      isDefault: json['is_default'] as bool? ?? false,
    );
  }

  @override
  Future<List<AddressEntity>> getAddresses() async {
    try {
      final response = await supabase
          .from('addresses')
          .select()
          .eq('user_id', _userId)
          .order('is_default', ascending: false)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => _fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data alamat');
    }
  }

  @override
  Future<AddressEntity> createAddress({
    required String recipientName,
    required String phone,
    required String address,
    required bool isDefault,
  }) async {
    try {
      // Kalau alamat ini di-set sebagai default, matikan default
      // di alamat lain milik user yang sama dulu.
      if (isDefault) {
        await supabase
            .from('addresses')
            .update({'is_default': false})
            .eq('user_id', _userId);
      }

      final response = await supabase
          .from('addresses')
          .insert({
            'user_id': _userId,
            'recipient_name': recipientName,
            'phone': phone,
            'address': address,
            'is_default': isDefault,
          })
          .select()
          .single();

      return _fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal menambah alamat');
    }
  }

  @override
  Future<AddressEntity> updateAddress({
    required int id,
    required String recipientName,
    required String phone,
    required String address,
  }) async {
    try {
      final response = await supabase
          .from('addresses')
          .update({
            'recipient_name': recipientName,
            'phone': phone,
            'address': address,
          })
          .eq('id', id)
          .select()
          .single();

      return _fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal mengubah alamat');
    }
  }

  @override
  Future<void> deleteAddress({required int id}) async {
    try {
      await supabase.from('addresses').delete().eq('id', id);
    } catch (e) {
      throw ServerException(message: 'Gagal menghapus alamat');
    }
  }

  @override
  Future<void> setDefaultAddress({required int id}) async {
    try {
      // Matikan default semua alamat user ini dulu
      await supabase
          .from('addresses')
          .update({'is_default': false})
          .eq('user_id', _userId);

      // Set alamat yang dipilih jadi default
      await supabase
          .from('addresses')
          .update({'is_default': true})
          .eq('id', id);
    } catch (e) {
      throw ServerException(message: 'Gagal mengatur alamat utama');
    }
  }
}