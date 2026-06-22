import 'package:kud_shop/src/auth/data/models/user_model.dart';

abstract class AuthSupabaseDataSource {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<UserModel> getCurrentUser();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}