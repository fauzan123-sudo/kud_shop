import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_supabase_datasource.dart';

class AuthSupabaseDataSourceImpl implements AuthSupabaseDataSource {
  final SupabaseClient supabase;

  AuthSupabaseDataSourceImpl(this.supabase);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException(message: 'Login gagal, silakan coba lagi');
      }
      return _fetchProfile(response.user!.id, response.user!.email!);
    } on AuthException catch (e) {
      throw ServerException(message: _mapAuthError(e.message));
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: 'Terjadi kesalahan, silakan coba lagi');
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      if (response.user == null) {
        throw ServerException(message: 'Registrasi gagal, silakan coba lagi');
      }

      // ← tidak fetch profile, langsung return dari response
      return UserModel(
        id: response.user!.id,
        email: email,
        name: name,
        role: 'customer',
      );
    } on AuthException catch (e) {
      throw ServerException(message: _mapAuthError(e.message));
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: 'Terjadi kesalahan, silakan coba lagi');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      throw ServerException(message: _mapAuthError(e.message));
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) throw UnauthorizedException();
      return _fetchProfile(user.id, user.email!);
    } on UnauthorizedException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data user');
    }
  }

  // ─── Helper ───────────────────────────────────────────────

  Future<UserModel> _fetchProfile(String userId, String email) async {
    final data = await supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();

    return UserModel(
      id: userId,
      email: email,
      name: data['name'] as String,
      role: data['role'] as String,
      phone: data['phone'] as String?,
      avatarUrl: data['avatar_url'] as String?,
    );
  }

  String _mapAuthError(String message) {
    if (message.contains('Invalid login credentials')) {
      return 'Email atau password salah';
    }
    if (message.contains('Email not confirmed')) {
      return 'Email belum dikonfirmasi';
    }
    if (message.contains('User already registered')) {
      return 'Email sudah terdaftar';
    }
    if (message.contains('Password should be at least')) {
      return 'Password minimal 8 karakter';
    }
    return message;
  }
}
