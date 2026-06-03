import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_ui_playground/src/auth/data/models/auth_token_model.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

import '../../../../core/constants/storage_keys.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage storage;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.storage,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthToken>> login({
    required String username,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final result = await remoteDataSource.login(
        username: username,
        password: password,
      );
      final token = result.toEntity();
      await storage.write(
        key: StorageKeys.accessToken,
        value: token.accessToken,
      );
      await storage.write(
        key: StorageKeys.refreshToken,
        value: token.refreshToken,
      );
      await storage.write(key: StorageKeys.userName, value: token.fullName);
      await storage.write(key: StorageKeys.userEmail, value: token.email);
      return Right(token);
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await storage.deleteAll();
      return const Right(null);
    } catch (e) {
      return handleError(e);
    }
  }
}
