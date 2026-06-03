import 'package:dartz/dartz.dart';
import 'package:flutter_ui_playground/core/error/failure.dart';
import 'package:flutter_ui_playground/core/usecases/usecase.dart';
import 'package:flutter_ui_playground/src/auth/domain/repositories/auth_repository.dart';

class Logout extends UseCase<void, NoParams> {
  final AuthRepository repository;
  Logout(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}