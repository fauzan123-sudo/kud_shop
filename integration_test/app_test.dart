import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'helpers/app_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app flow test', (tester) async {
    // ─── 1. Start App ────────────────────────────────────────
    await AppHelper.startApp(tester);

    // ─── 2. Login Flow ───────────────────────────────────────
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

    // ─── 3. Navigation Flow - ke Karyawan ────────────────────
    await tester.tap(find.byType(NavigationDestination).at(1));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await AppHelper.waitFor(tester, find.text('Karyawan'));
    expect(find.text('Karyawan'), findsWidgets);

    // ─── 4. Navigation Flow - ke Detail Karyawan ─────────────
    await AppHelper.waitFor(
      tester,
      find.text('Emily Johnson'),
      timeout: const Duration(seconds: 10),
    );
    await AppHelper.tapText(tester, 'Emily Johnson');
    await AppHelper.waitFor(tester, find.text('Detail Karyawan'));
    expect(find.text('Detail Karyawan'), findsOneWidget);
    expect(find.text('Emily Johnson'), findsOneWidget);

    // ─── 5. Kembali ke halaman Karyawan ──────────────────────
    final NavigatorState navigator = tester.state(find.byType(Navigator).last);
    navigator.pop();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // ← tunggu halaman Karyawan muncul kembali
    await AppHelper.waitFor(
      tester,
      find.text('Karyawan'),
      timeout: const Duration(seconds: 5),
    );

    // ─── 6. Navigation Flow - ke Profil ──────────────────────
    await tester.tap(find.byType(NavigationDestination).at(2));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await AppHelper.waitFor(tester, find.text('Profil Saya'));
    expect(find.text('Profil Saya'), findsOneWidget);

    // ─── 7. Logout Flow ──────────────────────────────────────
    await tester.tap(find.byIcon(Icons.logout));
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await AppHelper.waitFor(
      tester,
      find.text('Selamat datang'),
      timeout: const Duration(seconds: 10),
    );
    expect(find.text('Selamat datang'), findsOneWidget);
  });
}
