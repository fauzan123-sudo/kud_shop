import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kud_shop/component/themes/app_theme.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/bootstrap/app_bootstrap.dart';
import 'core/config/app_config.dart';
import 'core/navigation/app_router.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await AppBootstrap.init();
  await initializeDateFormatting('id_ID','');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (_) => Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 10),
            ],
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: AppConfig.showDebugBanner,
        routerConfig: AppRouter.createRouter(),
        title: AppConfig.appName,
        theme: AppTheme.lightTheme,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('id', 'ID')],
        locale: const Locale('id', 'ID'),
      ),
    );
  }
}
