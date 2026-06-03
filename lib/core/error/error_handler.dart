import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'exception.dart';
import 'failure.dart';

Either<Failure, T> handleError<T>(dynamic error) {
  // Kalau errornya DioException, ambil error aslinya dari .error
  final actualError = error is DioException ? error.error : error;

  if (actualError is UnauthorizedException) return const Left(UnauthorizedFailure());
  if (actualError is NetworkException)      return const Left(NetworkFailure());
  if (actualError is TimeoutException)      return const Left(TimeoutFailure());
  if (actualError is CacheException)        return const Left(CacheFailure());
  if (actualError is ServerException)       return Left(ServerFailure(actualError.message));

  return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
}