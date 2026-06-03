import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_ui_playground/main.dart' as app;

class AppHelper {
  static bool _appStarted = false;
  static void init() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  }

  static Future<void> startApp(WidgetTester tester) async {
    if (!_appStarted) {
      // ← hanya start sekali
      _appStarted = true;
      app.main();
    }
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  static Future<void> tapText(WidgetTester tester, String text) async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    final finder = find.text(text);

    // ← coba ensureVisible, kalau gagal lanjut saja
    try {
      await tester.ensureVisible(finder);
      await tester.pumpAndSettle();
    } catch (_) {}

    await tester.tap(finder.first, warnIfMissed: false); // ← pakai .first
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  static Future<void> tapKey(WidgetTester tester, Key key) async {
    await tester.tap(find.byKey(key));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  static Future<void> enterText(
    WidgetTester tester,
    Finder finder,
    String text,
  ) async {
    await tester.ensureVisible(finder); // ← pastikan visible
    await tester.pumpAndSettle();
    await tester.enterText(finder, text);
    await tester.pumpAndSettle();
  }

  static Future<void> waitFor(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 500));
      if (finder.evaluate().isNotEmpty) return;
    }
    throw Exception('Widget tidak ditemukan: $finder');
  }
}
