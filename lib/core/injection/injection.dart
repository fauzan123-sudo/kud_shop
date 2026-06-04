import 'package:get_it/get_it.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_supabase_datasource.dart';
import 'package:kud_shop/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:kud_shop/src/auth/domain/repositories/auth_repository.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';
import 'package:kud_shop/src/auth/domain/usecases/register.dart';
import 'package:kud_shop/src/auth/domain/usecases/logout.dart';
import 'package:kud_shop/src/auth/domain/usecases/get_current_user.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

void initDependencies() {
  // ─── External ───────────────────────────────────────────────
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // ─── Auth ───────────────────────────────────────────────────
  sl.registerLazySingleton<AuthSupabaseDataSource>(
    () => AuthSupabaseDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));

  sl.registerFactory(
    () => AuthBloc(
      login: sl(),
      register: sl(),
      logout: sl(),
      getCurrentUser: sl(),
    ),
  );
}
