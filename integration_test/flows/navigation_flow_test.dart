import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../helpers/app_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Navigation Flow', () {
    testWidgets('harus bisa navigasi ke halaman Karyawan', (tester) async {
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

      // 2. Tap tab Karyawan
      await AppHelper.tapText(tester, 'Karyawan');

      // 3. Tunggu halaman Karyawan muncul
      await AppHelper.waitFor(tester, find.text('Karyawan'));

      // 4. Pastikan di halaman Karyawan
      expect(find.text('Karyawan'), findsWidgets);
    });

    testWidgets('harus bisa navigasi ke halaman Profil', (tester) async {
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
        find.text('Ringkasan'), // ← sudah diganti
        timeout: const Duration(seconds: 15),
      );

      // 2. Tap tab Profil
      await AppHelper.tapText(tester, 'Profil');

      // 3. Tunggu halaman Profil muncul
      await AppHelper.waitFor(tester, find.text('Profil Saya'));

      // 4. Pastikan di halaman Profil
      expect(find.text('Profil Saya'), findsOneWidget);
    });

    testWidgets('harus bisa navigasi ke detail karyawan', (tester) async {
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
        find.text('Ringkasan'), // ← sudah diganti
        timeout: const Duration(seconds: 15),
      );

      // 2. Tap tab Karyawan
      await AppHelper.tapText(tester, 'Karyawan');

      // 3. Tunggu list karyawan muncul
      await AppHelper.waitFor(
        tester,
        find.text('Emily Johnson'),
        timeout: const Duration(seconds: 10),
      );

      // 4. Tap card Emily Johnson
      await AppHelper.tapText(tester, 'Emily Johnson');

      // 5. Tunggu halaman detail muncul
      await AppHelper.waitFor(tester, find.text('Detail Karyawan'));

      // 6. Pastikan di halaman detail
      expect(find.text('Detail Karyawan'), findsOneWidget);
      expect(find.text('Emily Johnson'), findsOneWidget);
    });
  });
}
