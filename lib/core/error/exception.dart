class ServerException implements Exception {
  final String message;
  final int? statusCode;
  ServerException({required this.message, this.statusCode});
}

class UnauthorizedException implements Exception {}
class NetworkException implements Exception {}
class TimeoutException implements Exception {}
class CacheException implements Exception {}