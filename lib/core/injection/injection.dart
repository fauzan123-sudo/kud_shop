import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kud_shop/core/constants/hive_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
// Auth
import '../../src/auth/data/datasources/auth_remote_datasource.dart';
import '../../src/auth/data/repositories/auth_repository_impl.dart';
import '../../src/auth/domain/repositories/auth_repository.dart';
import '../../src/auth/domain/usecases/login.dart';
import '../../src/auth/domain/usecases/logout.dart';
import '../../src/auth/presentation/bloc/auth_bloc.dart';
// Profile
import '../../src/profile/data/datasources/profile_remote_datasource.dart';
import '../../src/profile/data/repositories/profile_repository_impl.dart';
import '../../src/profile/domain/repositories/profile_repository.dart';
import '../../src/profile/domain/usecases/get_profile.dart';
import '../../src/profile/presentation/bloc/profile_bloc.dart';

// Profile
import '../../src/profile/data/datasources/profile_local_datasource.dart';

final sl = GetIt.instance;

void initDependencies() {
  // ─── External ───────────────────────────────────────────────
  sl.registerLazySingleton(
    () => const FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    ),
  );
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DioClient(sl()));

  // ─── Hive Boxes ─────────────────────────────────────────────
  sl.registerLazySingleton(
    () => HiveManager.employeeBox,
    instanceName: 'employeeBox',
  );
  sl.registerLazySingleton(
    () => HiveManager.profileBox,
    instanceName: 'profileBox',
  );

  // ─── Auth ───────────────────────────────────────────────────
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      storage: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerFactory(() => AuthBloc(login: sl(), logout: sl()));


  // ─── Profile ────────────────────────────────────────────────
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(sl(instanceName: 'profileBox')),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerFactory(() => ProfileBloc(sl()));
}
