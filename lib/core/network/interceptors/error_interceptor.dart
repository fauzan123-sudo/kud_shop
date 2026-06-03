import 'package:dio/dio.dart';
import '../../error/exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: TimeoutException(),
            type: err.type,
          ),
        );

      case DioExceptionType.connectionError:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: NetworkException(),
            type: err.type,
          ),
        );

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final data = err.response?.data;
        final message = data is Map
            ? data['message'] ?? 'Terjadi kesalahan'
            : 'Terjadi kesalahan';

        if (statusCode == 401) {
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: UnauthorizedException(),
              response: err.response,
              type: err.type,
            ),
          );
        }

        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ServerException(message: message, statusCode: statusCode),
            response: err.response,
            type: err.type,
          ),
        );

      default:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ServerException(message: 'Terjadi kesalahan tidak diketahui'),
            type: err.type,
          ),
        );
    }
  }
}