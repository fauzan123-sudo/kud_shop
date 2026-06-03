import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../helpers/app_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Flow', () {
    testWidgets('harus berhasil login dengan kredensial yang benar',
        (tester) async {
      await AppHelper.startApp(tester);
      await AppHelper.waitFor(tester, find.text('Selamat datang'));
      expect(find.text('Selamat datang'), findsOneWidget);

      await AppHelper.enterText(
        tester,
        find.byType(TextFormField).first,
        'emilys',
      );
      await AppHelper.enterText(
        tester,
        find.byType(TextFormField).last,
        'emilyspass',
      );

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.text('Masuk'),
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();

      await AppHelper.tapText(tester, 'Masuk');

      await AppHelper.waitFor(
        tester,
        find.text('Ringkasan'),
        timeout: const Duration(seconds: 15),
      );

      expect(find.text('Ringkasan'), findsOneWidget);
      expect(find.text('Menu Cepat'), findsOneWidget);
    });
  });
}
