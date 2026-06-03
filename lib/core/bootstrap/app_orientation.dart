import 'package:flutter/services.dart';

class AppOrientation {
  static Future<void> init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}