import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C974A),
          brightness: Brightness.light,
        ).copyWith(
          primary: const Color(0xFF2C974A), // ← paksa primary persis hijau ini
          onPrimary: Colors.white,
        ),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF2C974A), // ← sama dengan AppSystemUI
        statusBarIconBrightness: Brightness.light, // ← icon putih
        statusBarBrightness: Brightness.dark, // ← untuk iOS
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2C974A),
      brightness: Brightness.dark,
    ).copyWith(
      primary: const Color(0xFF2C974A),
      onPrimary: Colors.white,
    ),
  );
}
