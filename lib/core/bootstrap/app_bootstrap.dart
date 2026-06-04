import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../bloc/app_bloc_observer.dart';
import '../config/app_config.dart';
import '../injection/injection.dart';

class AppBootstrap {
  static Future<void> init() async {
    // Lock orientasi portrait
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Init Supabase
    await Supabase.initialize(
      url: AppConfig.supabaseUrl,
      anonKey: AppConfig.supabaseAnonKey,
    );

    // BLoC observer
    Bloc.observer = AppBlocObserver();

    // Dependency injection
    initDependencies();
  }
}