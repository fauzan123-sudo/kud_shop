import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/auth/presentation/pages/login_page.dart';
import 'package:kud_shop/src/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class AppRouter {
  static final _analytics = FirebaseAnalytics.instance;
  static final _observer = FirebaseAnalyticsObserver(analytics: _analytics);
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: _redirect,
    observers: [_observer],
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const MainPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Halaman tidak ditemukan: ${state.error}')),
    ),
  );

  static Future<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'access_token');

    final isLoggedIn = token != null && token.isNotEmpty;
    final isSplash = state.matchedLocation == AppRoutes.splash;
    final isLogin = state.matchedLocation == AppRoutes.login;

    if (!isLoggedIn && !isLogin) return AppRoutes.login;
    if (isLoggedIn && (isSplash || isLogin)) return AppRoutes.home;

    return null;
  }
}
