import 'package:flutter_test/flutter_test.dart';
import 'package:kud_shop/core/error/error_handler.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';

void main() {
  group('handleError', () {
    test('mengembalikan UnauthorizedFailure saat UnauthorizedException', () {
      final result = handleError<String>(UnauthorizedException());
      expect(result.fold((f) => f, (_) => null), isA<UnauthorizedFailure>());
    });

    test('mengembalikan NetworkFailure saat NetworkException', () {
      final result = handleError<String>(NetworkException());
      expect(result.fold((f) => f, (_) => null), isA<NetworkFailure>());
    });

    test('mengembalikan TimeoutFailure saat TimeoutException', () {
      final result = handleError<String>(TimeoutException());
      expect(result.fold((f) => f, (_) => null), isA<TimeoutFailure>());
    });

    test('mengembalikan ServerFailure dengan message saat ServerException', () {
      final result = handleError<String>(
        ServerException(message: 'Server error', statusCode: 500),
      );
      final failure = result.fold((f) => f, (_) => null);
      expect(failure, isA<ServerFailure>());
      expect(failure?.message, 'Server error');
    });

    test('mengembalikan ServerFailure default saat error tidak dikenal', () {
      final result = handleError<String>(Exception('unknown'));
      final failure = result.fold((f) => f, (_) => null);
      expect(failure, isA<ServerFailure>());
      expect(failure?.message, 'Terjadi kesalahan tidak diketahui');
    });
  });
}
