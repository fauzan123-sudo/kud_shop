import 'package:kud_shop/core/config/app_config.dart';
import 'main.dart' as app;

void main() {
  AppConfig.flavor = Flavor.production;
  app.main();
}
