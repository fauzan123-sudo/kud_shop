import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_empty.dart';

void main() {
  Widget buildWidget() {
    return const MaterialApp(home: Scaffold(body: EmployeeEmpty()));
  }

  group('EmployeeEmpty', () {
    testWidgets('harus menampilkan icon people_outline', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byIcon(Icons.people_outline), findsOneWidget);
    });

    testWidgets('harus menampilkan teks karyawan tidak ditemukan', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Karyawan tidak ditemukan'), findsOneWidget);
    });
  });
}
