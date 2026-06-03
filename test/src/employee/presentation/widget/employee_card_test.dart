import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_card.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_ui_playground/src/employee/domain/entities/employee.dart';

void main() {
  // data dummy untuk test
  const tEmployee = Employee(
    id: 1,
    name: 'Emily Johnson',
    email: 'emily@test.com',
    phone: '+62 123 456 789',
    position: 'Software Engineer',
    department: 'Engineering',
    avatarUrl: 'https://dummyjson.com/icon/emilys/128',
    isActive: true,
  );

  const tEmployeeInactive = Employee(
    id: 2,
    name: 'John Doe',
    email: 'john@test.com',
    phone: '+62 987 654 321',
    position: 'Designer',
    department: 'Marketing',
    avatarUrl: '',
    isActive: false,
  );

  // helper untuk wrap widget dengan MaterialApp
  Widget buildWidget(Employee employee) {
    return MaterialApp(
      home: Scaffold(body: EmployeeCard(employee: employee)),
    );
  }

  group('EmployeeCard', () {
    testWidgets('harus menampilkan nama karyawan', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployee));
        expect(find.text('Emily Johnson'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan posisi karyawan', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployee));
        expect(find.text('Software Engineer'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan departemen karyawan', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployee));
        expect(find.text('Engineering'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan status Aktif', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployee));
        expect(find.text('Aktif'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan status Nonaktif', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployeeInactive));
        expect(find.text('Nonaktif'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan inisial jika avatarUrl kosong', (
      tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployeeInactive));
        // ← inisial dari nama 'John Doe' adalah 'J'
        expect(find.text('J'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan avatar jika avatarUrl tidak kosong', (
      tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget(tEmployee));
        // ← CircleAvatar dengan NetworkImage harus ada
        expect(find.byType(CircleAvatar), findsOneWidget);
      });
    });
  });
}
