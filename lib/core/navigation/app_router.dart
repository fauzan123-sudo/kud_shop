import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/src/admin/category/presentation/pages/category_page.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';
import 'package:kud_shop/src/admin/product/presentation/pages/admin_product_page.dart';
import 'package:kud_shop/src/admin/product/presentation/pages/product_form_page.dart';
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

        // Masih loading / initial — tampilkan splash
        if (authState is AuthInitial || authState is AuthLoading) {
          return location == AppRoutes.splash ? null : AppRoutes.splash;
        }

        // Belum login
        if (authState is AuthUnauthenticated || authState is AuthError) {
          final isAuthPage =
              location == AppRoutes.login || location == AppRoutes.register;
          return isAuthPage ? null : AppRoutes.login;
        }

        // Sudah login
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

        // ─── Admin Shell ──────────────────────────────────────
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
            // Product + Category
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.adminProduct,
                  builder: (_, __) => const AdminProductPage(),
                  routes: [
                    GoRoute(
                      path: 'category',
                      builder: (_, __) => const CategoryPage(),
                    ),
                    GoRoute(
                      path: 'add',
                      builder: (_, __) => BlocProvider.value(
                        value: sl<ProductBloc>(),
                        child: const ProductFormPage(),
                      ),
                    ),
                    GoRoute(
                      path: 'edit',
                      builder: (context, state) => BlocProvider.value(
                        value: sl<ProductBloc>(),
                        child: ProductFormPage(
                          product: state.extra as ProductEntity?,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Profile
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.adminProfile,
                  builder: (_, __) => const AdminProfilePlaceholder(),
                ),
              ],
            ),
          ],
        ),

        // ─── Customer Shell ───────────────────────────────────
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => BlocProvider.value(
            value: authBloc,
            child: CustomerShell(navigationShell: navigationShell),
          ),
          branches: [
            // Home
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerHome,
                  builder: (_, __) => const CustomerDashboardPlaceholder(),
                ),
              ],
            ),
            // Product
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerProduct,
                  builder: (_, __) => const CustomerProductPlaceholder(),
                ),
              ],
            ),
            // Cart
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerCart,
                  builder: (_, __) => const CustomerCartPlaceholder(),
                ),
              ],
            ),
            // Checkout
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerCheckout,
                  builder: (_, __) => const CustomerCheckoutPlaceholder(),
                ),
              ],
            ),
            // Profile
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.customerProfile,
                  builder: (_, __) => const CustomerProfilePlaceholder(),
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

class CustomerDashboardPlaceholder extends StatelessWidget {
  const CustomerDashboardPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Customer Dashboard')));
}

class CustomerProductPlaceholder extends StatelessWidget {
  const CustomerProductPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Customer Product')));
}

class CustomerCartPlaceholder extends StatelessWidget {
  const CustomerCartPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Customer Cart')));
}

class CustomerCheckoutPlaceholder extends StatelessWidget {
  const CustomerCheckoutPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Customer Checkout')));
}

class CustomerProfilePlaceholder extends StatelessWidget {
  const CustomerProfilePlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Customer Profile')));
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
