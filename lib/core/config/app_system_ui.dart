import 'package:flutter/services.dart';

class AppSystemUI {
  AppSystemUI._();

  static void setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF2C974A),
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  // Nanti kalau mau dark mode status bar, tinggal tambah method baru:
  // static void setStatusBarDark() { ... }
  // static void setStatusBarTransparent() { ... }
}
