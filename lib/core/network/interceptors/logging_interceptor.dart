import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('→ [${options.method}] ${options.uri}');
    debugPrint('   Headers: ${options.headers}');
    if (options.data != null) debugPrint('   Body: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('← [${response.statusCode}] ${response.requestOptions.uri}');
    debugPrint('   Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('✗ [${err.response?.statusCode}] ${err.requestOptions.uri}');
    debugPrint('   Error: ${err.message}');
    handler.next(err);
  }
}