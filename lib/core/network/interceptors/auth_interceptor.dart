import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_ui_playground/core/config/app_config.dart';
import '../../constants/storage_keys.dart';
import '../../constants/api_endpoints.dart';
import '../../constants/app_constants.dart';
import '../../navigation/navigation_service.dart';
import '../../navigation/app_routes.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  bool _isRefreshing = false;

  AuthInterceptor(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: StorageKeys.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final isUnauthorized = err.response?.statusCode == 401;
    final isRefreshEndpoint = err.requestOptions.path.contains(
      ApiEndpoints.refresh,
    );

    if (isUnauthorized && !isRefreshEndpoint && !_isRefreshing) {
      _isRefreshing = true;
      final refreshed = await _refreshToken();
      _isRefreshing = false;

      if (refreshed) {
        try {
          final response = await _retry(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          await storage.deleteAll();
          NavigationService.navigateTo(AppRoutes.login);
        }
      } else {
        await storage.deleteAll();
        NavigationService.navigateTo(AppRoutes.login);
      }
      return;
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await storage.read(key: StorageKeys.refreshToken);
      if (refreshToken == null) return false;

      final dio = Dio(
        BaseOptions(baseUrl: AppConfig.baseUrl),
      );
      final response = await dio.post(
        ApiEndpoints.refresh,
        data: {
          'refreshToken': refreshToken,
          'expiresInMins': AppConstants.tokenExpiry,
        },
      );

      final newToken = response.data['accessToken'] ?? response.data['token'];
      if (newToken == null) return false;

      await storage.write(key: StorageKeys.accessToken, value: newToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final token = await storage.read(key: StorageKeys.accessToken);
    final dio = Dio(
      BaseOptions(baseUrl: AppConfig.baseUrl), 
    );
    final options = Options(
      method: requestOptions.method,
      headers: {...requestOptions.headers, 'Authorization': 'Bearer $token'},
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
