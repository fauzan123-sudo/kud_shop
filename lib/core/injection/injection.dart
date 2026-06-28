import 'package:get_it/get_it.dart';
import 'package:kud_shop/src/admin/category/data/datasources/category_supabase_datasource.dart';
import 'package:kud_shop/src/admin/category/data/repositories/category_repository_impl.dart';
import 'package:kud_shop/src/admin/category/domain/repositories/category_repository.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/create_category.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/delete_category.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/update_category.dart';
import 'package:kud_shop/src/admin/category/presentation/bloc/category_bloc.dart';
import 'package:kud_shop/src/admin/dashboard/data/datasources/admin_dashboard_datasource.dart';
import 'package:kud_shop/src/admin/dashboard/data/repositories/admin_dashboard_repository.dart';
import 'package:kud_shop/src/admin/dashboard/presentation/bloc/admin_dashboard_bloc.dart';
import 'package:kud_shop/src/admin/order/data/datasouces/admin_order_datasource.dart';
import 'package:kud_shop/src/admin/order/data/repositories/admin_order_repository_impl.dart';
import 'package:kud_shop/src/admin/order/domain/repositories/admin_order_repository.dart';
import 'package:kud_shop/src/admin/order/domain/usecases/get_all_orders.dart';
import 'package:kud_shop/src/admin/order/domain/usecases/update_order_status.dart';
import 'package:kud_shop/src/admin/order/presentation/bloc/admin_order_bloc.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_supabase_datasource.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_supabase_datasource_impl.dart';
import 'package:kud_shop/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:kud_shop/src/auth/domain/repositories/auth_repository.dart';
import 'package:kud_shop/src/auth/domain/usecases/change_password.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';
import 'package:kud_shop/src/auth/domain/usecases/register.dart';
import 'package:kud_shop/src/auth/domain/usecases/logout.dart';
import 'package:kud_shop/src/auth/domain/usecases/get_current_user.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:kud_shop/src/customer/address/data/datasources/address_supabase_datasource.dart';
import 'package:kud_shop/src/customer/address/data/repositories/address_repository_impl.dart';
import 'package:kud_shop/src/customer/address/domain/repositories/address_repository.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/create_address.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/delete_address.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/get_addresses.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/set_default_address.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/update_address.dart';
import 'package:kud_shop/src/customer/address/presentation/bloc/address_bloc.dart';
import 'package:kud_shop/src/customer/cart/data/datasources/cart_supabase_datasource.dart';
import 'package:kud_shop/src/customer/cart/data/repositories/cart_repository_impl.dart';
import 'package:kud_shop/src/customer/cart/domain/repositories/cart_repository.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/add_to_cart.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/get_cart_items.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/remove_from_cart.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/update_cart_quantity.dart';
import 'package:kud_shop/src/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:kud_shop/src/customer/dashboard/presentation/bloc/dashboard_product_bloc.dart';
import 'package:kud_shop/src/customer/order/data/datasources/order_supabase_datasource.dart';
import 'package:kud_shop/src/customer/order/data/repositories/order_repository_impl.dart';
import 'package:kud_shop/src/customer/order/domain/repositories/order_repository.dart';
import 'package:kud_shop/src/customer/order/domain/usecases/create_order.dart';
import 'package:kud_shop/src/customer/order/domain/usecases/get_my_orders.dart';
import 'package:kud_shop/src/customer/order/domain/usecases/upload_payment_proof.dart';
import 'package:kud_shop/src/customer/order/presentation/bloc/checkout_bloc.dart';
import 'package:kud_shop/src/customer/product/presentation/bloc/customer_product_bloc.dart';
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

  sl.registerLazySingleton(
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

  // ─── Cart ─────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<CartSupabaseDataSource>(
    () => CartSupabaseDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => GetCartItems(sl()));
  sl.registerLazySingleton(() => AddToCart(sl()));
  sl.registerLazySingleton(() => UpdateCartQuantity(sl()));
  sl.registerLazySingleton(() => RemoveFromCart(sl()));
  sl.registerFactory(
    () => CartBloc(
      getCartItems: sl(),
      addToCart: sl(),
      updateCartQuantity: sl(),
      removeFromCart: sl(),
    ),
  );

  // Dashboard
  sl.registerFactory(() => DashboardProductBloc(getProducts: sl()));

  // ─── Customer Product ──────────────────────────────────────────
  sl.registerFactory(
    () => CustomerProductBloc(getProducts: sl(), getCategories: sl()),
  );

  // ─── Address ──────────────────────────────────────────────────
  sl.registerLazySingleton<AddressSupabaseDataSource>(
    () => AddressSupabaseDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => GetAddresses(sl()));
  sl.registerLazySingleton(() => CreateAddress(sl()));
  sl.registerLazySingleton(() => UpdateAddress(sl()));
  sl.registerLazySingleton(() => DeleteAddress(sl()));
  sl.registerLazySingleton(() => SetDefaultAddress(sl()));
  sl.registerFactory(
    () => AddressBloc(
      getAddresses: sl(),
      createAddress: sl(),
      updateAddress: sl(),
      deleteAddress: sl(),
      setDefaultAddress: sl(),
    ),
  );

  sl.registerLazySingleton<OrderSupabaseDataSource>(
    () => OrderSupabaseDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => CreateOrder(sl()));
  sl.registerLazySingleton(() => GetMyOrders(sl()));
  sl.registerLazySingleton(() => UploadPaymentProof(sl()));

  sl.registerLazySingleton(() => ChangePassword(sl()));

  // ─── Admin Order ──────────────────────────────────────────
  sl.registerLazySingleton<AdminOrderDataSource>(
    () => AdminOrderDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AdminOrderRepository>(
    () => AdminOrderRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton(() => GetAllOrders(sl()));
  sl.registerLazySingleton(() => UpdateOrderStatus(sl()));
  sl.registerFactory(
    () => AdminOrderBloc(getAllOrders: sl(), updateOrderStatus: sl()),
  );

  // ─── Admin Dashboard ──────────────────────────────────────
  sl.registerLazySingleton<AdminDashboardDataSource>(
    () => AdminDashboardDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AdminDashboardRepository>(
    () => AdminDashboardRepositoryImpl(dataSource: sl()),
  );
  sl.registerFactory(() => AdminDashboardBloc(repository: sl()));

  sl.registerFactory(
    () =>
        CheckoutBloc(getCartItems: sl(), getAddresses: sl(), createOrder: sl()),
  );
}
