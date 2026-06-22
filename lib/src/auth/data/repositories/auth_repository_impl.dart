import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/error_handler.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/auth/data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_supabase_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dataSource.login(email: email, password: password);
      return Right(result.toEntity());
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await dataSource.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(result.toEntity());
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final result = await dataSource.getCurrentUser();
      return Right(result.toEntity());
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await dataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return const Right(null);
    } catch (e) {
      return handleError(e);
    }
  }
}