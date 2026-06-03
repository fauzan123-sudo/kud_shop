import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_ui_playground/src/employee/domain/entities/employee.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_bloc.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_event.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_state.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_card.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_empty.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_shimmer.dart';

class MockEmployeeBloc extends MockBloc<EmployeeEvent, EmployeeState>
    implements EmployeeBloc {}

void main() {
  late MockEmployeeBloc mockEmployeeBloc;

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

  setUp(() {
    mockEmployeeBloc = MockEmployeeBloc();
  });

  tearDown(() {
    mockEmployeeBloc.close();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: BlocProvider<EmployeeBloc>.value(
        value: mockEmployeeBloc,
        child: Scaffold(
          body: BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (context, state) {
              if (state is EmployeeLoading) {
                return const EmployeeShimmer();
              }
              if (state is EmployeeLoaded) {
                if (state.filtered.isEmpty) return const EmployeeEmpty();
                return ListView.builder(
                  itemCount: state.filtered.length,
                  itemBuilder: (_, index) =>
                      EmployeeCard(employee: state.filtered[index]),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  group('EmployeePage', () {
    testWidgets('harus menampilkan shimmer saat loading', (tester) async {
      when(() => mockEmployeeBloc.state).thenReturn(const EmployeeLoading());

      await tester.pumpWidget(buildWidget());
      expect(find.byType(EmployeeShimmer), findsOneWidget);
    });

    testWidgets('harus menampilkan list karyawan saat loaded', (tester) async {
      when(() => mockEmployeeBloc.state).thenReturn(
        const EmployeeLoaded(
          employees: [tEmployee],
          filtered: [tEmployee],
        ),
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.byType(EmployeeCard), findsOneWidget);
        expect(find.text('Emily Johnson'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan empty widget saat data kosong', (
      tester,
    ) async {
      when(
        () => mockEmployeeBloc.state,
      ).thenReturn(const EmployeeLoaded(employees: [], filtered: []));

      await tester.pumpWidget(buildWidget());
      expect(find.byType(EmployeeEmpty), findsOneWidget);
      expect(find.text('Karyawan tidak ditemukan'), findsOneWidget);
    });

    testWidgets('harus menampilkan lebih dari satu karyawan', (tester) async {
      const tEmployee2 = Employee(
        id: 2,
        name: 'John Doe',
        email: 'john@test.com',
        phone: '+62 987 654 321',
        position: 'Designer',
        department: 'Marketing',
        avatarUrl: '',
        isActive: false,
      );

      when(() => mockEmployeeBloc.state).thenReturn(
        const EmployeeLoaded(
          employees: [tEmployee, tEmployee2],
          filtered: [tEmployee, tEmployee2],
        ),
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.byType(EmployeeCard), findsNWidgets(2));
      });
    });
  });
}
