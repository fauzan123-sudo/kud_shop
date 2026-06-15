import 'package:get_it/get_it.dart';
import 'package:kud_shop/src/admin/category/data/datasources/category_supabase_datasource.dart';
import 'package:kud_shop/src/admin/category/data/repositories/category_repository_impl.dart';
import 'package:kud_shop/src/admin/category/domain/repositories/category_repository.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/create_category.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/delete_category.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/update_category.dart';
import 'package:kud_shop/src/admin/category/presentation/bloc/category_bloc.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_supabase_datasource.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_supabase_datasource_impl.dart';
import 'package:kud_shop/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:kud_shop/src/auth/domain/repositories/auth_repository.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';
import 'package:kud_shop/src/auth/domain/usecases/register.dart';
import 'package:kud_shop/src/auth/domain/usecases/logout.dart';
import 'package:kud_shop/src/auth/domain/usecases/get_current_user.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kud_shop/src/admin/product/data/datasources/product_supabase_datasource.dart';
import 'package:kud_shop/src/admin/product/data/datasources/product_supabase_datasource_impl.dart';
import 'package:kud_shop/src/admin/product/data/repositories/product_repository_impl.dart';
import 'package:kud_shop/src/admin/product/domain/repositories/product_repository.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/get_products.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/create_product.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/update_product.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/delete_product.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';

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

   // ─── Category ───────────────────────────────────────────────────────────────
  sl.registerLazySingleton<CategorySupabaseDataSource>(
    () => CategorySupabaseDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => GetCategories(sl()));
  
  sl.registerLazySingleton(() => CreateCategory(sl()));
  sl.registerLazySingleton(() => UpdateCategory(sl()));
  sl.registerLazySingleton(() => DeleteCategory(sl()));
  sl.registerFactory(
    () => CategoryBloc(
      getCategories: sl(),
      createCategory: sl(),
      updateCategory: sl(),
      deleteCategory: sl(),
    ),
  );

  // ─── Product ─────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<ProductSupabaseDataSource>(
    () => ProductSupabaseDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => CreateProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));
  sl.registerFactory(
    () => ProductBloc(
      getProducts: sl(),
      createProduct: sl(),
      updateProduct: sl(),
      deleteProduct: sl(),
    ),
  );

}
