import 'package:dartz/dartz.dart';
import 'package:flutter_ui_playground/core/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetProfile extends UseCase<Profile, NoParams> {
  final ProfileRepository repository;
  GetProfile(this.repository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    return repository.getProfile();
  }
}
