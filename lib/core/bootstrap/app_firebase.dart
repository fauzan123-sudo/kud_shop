import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import '../../firebase_options.dart';
import '../config/app_config.dart';

class AppFirebase {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _initAnalytics();
    if (!kIsWeb) await _initCrashlytics();
  }

  static Future<void> _initAnalytics() async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.setAnalyticsCollectionEnabled(!kDebugMode);
  }

  static Future<void> _initCrashlytics() async {
    FlutterError.onError = (details) {
      if (AppConfig.enableCrashlytics) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      } else {
        debugPrint('FlutterError: ${details.exceptionAsString()}');
      }
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      if (AppConfig.enableCrashlytics) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      } else {
        debugPrint('PlatformError: $error');
      }
      return true;
    };

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      AppConfig.enableCrashlytics,
    );
  }
}