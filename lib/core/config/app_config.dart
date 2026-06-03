enum Flavor { dev, staging, production }

class AppConfig {
  static Flavor flavor = Flavor.dev;

  // ← baseUrl berbeda per flavor
  static String get baseUrl {
    switch (flavor) {
      case Flavor.dev:
        return 'https://dummyjson.com'; // development
      case Flavor.staging:
        return 'https://dummyjson.com'; // staging  
      case Flavor.production:
        return 'https://dummyjson.com'; // production  
    }
  }

  // ← nama app berbeda per flavor
  static String get appName {
    switch (flavor) {
      case Flavor.dev:
        return 'Flutter BLoC [DEV]';
      case Flavor.staging:
        return 'Flutter BLoC [STG]';
      case Flavor.production:
        return 'Flutter BLoC';
    }
  }

  // Crashlytics di staging dan production
  static bool get enableCrashlytics {
    switch (flavor) {
      case Flavor.dev:
        return false;
      case Flavor.staging:
      case Flavor.production:
        return true;
    }
  }

  // ← logging di dev
  static bool get enableLogging {
    switch (flavor) {
      case Flavor.dev:
        return true;
      case Flavor.staging:
      case Flavor.production:
        return false;
    }
  }

  //debug banner dev dan staging
  static bool get showDebugBanner {
    switch (flavor) {
      case Flavor.dev:
      case Flavor.staging:
        return true;
      case Flavor.production:
        return false;
    }
  }

  static bool get isProduction => flavor == Flavor.production;
  static bool get isDev => flavor == Flavor.dev;
  static bool get isStaging => flavor == Flavor.staging;
}