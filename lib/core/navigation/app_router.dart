import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/src/admin/category/presentation/pages/category_page.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';
import 'package:kud_shop/src/admin/product/presentation/pages/admin_product_page.dart';
import 'package:kud_shop/src/admin/product/presentation/pages/product_detail_page.dart';
import 'package:kud_shop/src/admin/product/presentation/pages/product_form_page.dart';
import 'package:kud_shop/src/customer/address/presentation/pages/address_list_page.dart';
import 'package:kud_shop/src/customer/cart/presentation/page/cart_page.dart';
import 'package:kud_shop/src/customer/dashboard/presentation/pages/dashboard_page_customer.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import 'package:kud_shop/src/customer/order/presentation/pages/checkout_page.dart';
import 'package:kud_shop/src/customer/order/presentation/pages/payment_proof_page.dart';
import 'package:kud_shop/src/customer/product/presentation/pages/customer_product_page.dart';
import 'package:kud_shop/src/customer/product_detail/presentation/widget/customer_product_detail_page.dart';
import 'package:kud_shop/src/profile/presentation/pages/change_password_page.dart';
import 'package:kud_shop/src/profile/presentation/pages/profile_edit_page.dart';
import 'package:kud_shop/src/profile/presentation/pages/profile_page.dart';
import '../../src/auth/presentation/bloc/auth_bloc.dart';
import '../../src/auth/presentation/bloc/auth_event.dart';
import '../../src/auth/presentation/bloc/auth_state.dart';
import '../../src/auth/presentation/pages/login_page.dart';
import '../../src/auth/presentation/pages/register_page.dart';
import '../../src/admin/shell/admin_shell.dart';
import '../../src/customer/shell/customer_shell.dart';
import '../../src/splash/presentation/splash_screen.dart';
import '../injection/injection.dart';
import 'app_routes.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter createRouter() {
    final authBloc = sl<AuthBloc>()..add(const AuthEvent.started());

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoutes.splash,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;
        final location = state.matchedLocation;

        if (authState is AuthInitial || authState is AuthLoading) {
          final isAuthPage =
              location == AppRoutes.login || location == AppRoutes.register;
          if (isAuthPage)
            return null; 
          return location == AppRoutes.splash ? null : AppRoutes.splash;
        }

        if (authState is AuthUnauthenticated || authState is AuthError) {
          final isAuthPage =
              location == AppRoutes.login || location == AppRoutes.register;
          return isAuthPage ? null : AppRoutes.login;
        }

        if (authState is AuthAuthenticated ||
            authState is AuthRegisterSuccess) {
          final user = authState is AuthAuthenticated
              ? authState.user
              : (authState as AuthRegisterSuccess).user;

          if (user.isAdmin && location.startsWith('/admin')) return null;
          if (user.isCustomer && location.startsWith('/customer')) return null;

          return user.isAdmin ? AppRoutes.adminHome : AppRoutes.customerHome;
        }

        return null;
      },
      routes: [
        // ─── Auth & Splash ────────────────────────────────────
        GoRoute(
          path: AppRoutes.splash,
          builder: (_, __) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (_, __) =>
              BlocProvider.value(value: authBloc, child: const LoginPage()),
        ),
        GoRoute(
          path: AppRoutes.register,
          builder: (_, __) =>
              BlocProvider.value(value: authBloc, child: const RegisterPage()),
        ),

        // ─── Halaman tanpa bottom nav (di luar Shell) ─────────
        GoRoute(
          path: AppRoutes.adminCategory,
          builder: (_, __) => const CategoryPage(),
        ),
        GoRoute(
          path: AppRoutes.adminProductAdd,
          builder: (_, __) => BlocProvider(
            create: (_) => sl<ProductBloc>(),
            child: const ProductFormPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.adminProductEdit,
          builder: (context, state) => BlocProvider(
            create: (_) => sl<ProductBloc>(),
            child: ProductFormPage(product: state.extra as ProductEntity?),
          ),
        ),
        GoRoute(
          path: AppRoutes.adminProductDetail,
          builder: (context, state) =>
              ProductDetailPage(product: state.extra as ProductEntity),
        ),
        GoRoute(
          path: AppRoutes.adminProfileEdit,
          builder: (_, __) => const ProfileEditPage(),
        ),
        GoRoute(
          path: AppRoutes.adminChangePassword,
          builder: (_, __) => const ChangePasswordPage(),
        ),
        GoRoute(
          path: AppRoutes.customerProfileEdit,
          builder: (_, __) => const ProfileEditPage(),
        ),
        GoRoute(
          path: AppRoutes.customerAddressList,
          builder: (_, __) => const AddressListPage(),
        ),
        GoRoute(
          path: AppRoutes.customerChangePassword,
          builder: (_, __) => const ChangePasswordPage(),
        ),
        GoRoute(
          path: AppRoutes.customerProductDetail,
          builder: (context, state) =>
              CustomerProductDetailPage(product: state.extra as ProductEntity),
        ),
        GoRoute(
          path: AppRoutes.customerProduct,
          builder: (_, __) => const CustomerProductPage(),
        ),
        GoRoute(
          path: AppRoutes.customerCheckout,
          builder: (_, __) => const CheckoutPage(),
        ),
        GoRoute(
          path: AppRoutes.customerPaymentProof,
          builder: (context, state) =>
              PaymentProofPage(order: state.extra as OrderEntity),
        ),

        // ─── Admin Shell (dengan bottom nav) ──────────────────
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => BlocProvider.value(
            value: authBloc,
            child: AdminShell(navigationShell: navigationShell),
          ),
          branches: [
            // Dashboard
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.adminHome,
                  builder: (_, __) => const AdminDashboardPlaceholder(),
                ),
              ],
            ),
            // Order
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.adminOrder,
                  builder: (_, __) => const AdminOrderPlaceholder(),
                ),
              ],
            ),
            // Product (tanpa sub-route, sudah dipindah ke atas)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.adminProduct,
                  builder: (_, __) => const AdminProductPage(),
                ),
              ],
            ),
            // Profile
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.adminProfile,
                  builder: (_, __) => BlocProvider.value(
                    value: authBloc,
                    child: const ProfilePage(),
                  ),
                ),
              ],
            ),
          ],
        ),

        // ─── Customer Shell (dengan bottom nav) ───────────────
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => BlocProvider.value(
            value: authBloc,
            child: CustomerShell(navigationShell: navigationShell),
          ),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerHome,
                  builder: (_, __) => const DashboardPageCustomer(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerCart,
                  builder: (_, __) => const CartPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerProfile,
                  builder: (_, __) => BlocProvider.value(
                    value: authBloc,
                    child: const ProfilePage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Placeholder Pages ────────────────────────────────────────
class AdminDashboardPlaceholder extends StatelessWidget {
  const AdminDashboardPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Admin Dashboard')));
}

class AdminOrderPlaceholder extends StatelessWidget {
  const AdminOrderPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Admin Order')));
}

class AdminProfilePlaceholder extends StatelessWidget {
  const AdminProfilePlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Admin Profile')));
}

// ─── GoRouter Refresh Stream ──────────────────────────────────
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
