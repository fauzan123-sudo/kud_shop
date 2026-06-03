import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../helpers/app_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Logout Flow', () {
    testWidgets('harus berhasil logout dan kembali ke halaman login', (
      tester,
    ) async {
      // 1. Jalankan aplikasi dan login
      await AppHelper.startApp(tester);
      await AppHelper.waitFor(tester, find.text('Selamat datang'));
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
      await AppHelper.tapText(tester, 'Masuk');
      await AppHelper.waitFor(
        tester,
        find.text('Ringkasan'),
        timeout: const Duration(seconds: 15),
      );

      // 2. Pindah ke halaman Profil
      await AppHelper.tapText(tester, 'Profil');
      await AppHelper.waitFor(tester, find.text('Profil Saya'));

      // 3. Tap tombol logout
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // 4. Pastikan kembali ke halaman login
      await AppHelper.waitFor(
        tester,
        find.text('Selamat datang'),
        timeout: const Duration(seconds: 10),
      );
      expect(find.text('Selamat datang'), findsOneWidget);
    });
  });
}
