import 'package:flutter_ui_playground/core/config/app_config.dart';
import 'main.dart' as app;

void main() {
  AppConfig.flavor = Flavor.dev;
  app.main();
}
