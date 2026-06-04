import 'package:dartz/dartz.dart';
import 'package:kud_shop/src/auth/domain/entities/user_entity.dart';
import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });
 
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  });
 
  Future<Either<Failure, void>> logout();
 
  Future<Either<Failure, UserEntity>> getCurrentUser();
}