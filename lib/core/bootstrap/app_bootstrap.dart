import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kud_shop/core/config/app_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../bloc/app_bloc_observer.dart';
import '../constants/hive_manager.dart';
import '../injection/injection.dart';
import '../navigation/app_router.dart';
import '../navigation/navigation_service.dart';
import 'app_firebase.dart';
import 'app_orientation.dart';

class AppBootstrap {
  static Future<void> init(WidgetsBinding widgetsBinding) async {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Supabase.initialize(
      url: AppConfig.supabaseUrl,
      anonKey: AppConfig.supabaseAnonKey,
    );
    await AppFirebase.init();
    await AppOrientation.init();
    await HiveManager.init();
    Bloc.observer = AppBlocObserver();
    initDependencies();
    NavigationService.router = AppRouter.router;
    FlutterNativeSplash.remove();
  }
}
