import 'package:dartz/dartz.dart';
import 'package:flutter_ui_playground/core/error/exception.dart';
import 'package:flutter_ui_playground/src/profile/data/datasources/profile_local_datasource.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource  localDataSource;
  final NetworkInfo             networkInfo;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    if (await networkInfo.isConnected) {
      // Online — ambil dari remote lalu simpan ke cache
      try {
        final result = await remoteDataSource.getProfile();
        await localDataSource.cacheProfile(result); // simpan ke cache
        return Right(result.toEntity());
      } catch (e) {
        return handleError(e);
      }
    } else {
      // Offline — ambil dari cache
      try {
        final cached = await localDataSource.getCachedProfile();
        return Right(cached.toEntity());
      } on CacheException {
        return const Left(CacheFailure());
      } catch (e) {
        return handleError(e);
      }
    }
  }
}
