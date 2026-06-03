import 'package:dio/dio.dart';
import '../models/auth_token_model.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/constants/app_constants.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> login({
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthTokenModel> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      ApiEndpoints.login,
      data: {
        'username': username,
        'password': password,
        'expiresInMins': AppConstants.tokenExpiry,
      },
    );
    return AuthTokenModel.fromJson(response.data);
  }
}
