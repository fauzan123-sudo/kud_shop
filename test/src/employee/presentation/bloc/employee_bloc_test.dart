import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/core/error/failure.dart';
import 'package:flutter_ui_playground/src/employee/domain/usecases/get_employees.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_bloc.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_event.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_state.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late EmployeeBloc bloc;
  late MockGetEmployees mockGetEmployees;

  setUp(() {
    mockGetEmployees = MockGetEmployees();
    bloc = EmployeeBloc(mockGetEmployees);
  });

  tearDown(() => bloc.close());

  test('initial state harus EmployeeInitial', () {
    expect(bloc.state, const EmployeeState.initial());
  });

  group('GetEmployeesEvent', () {
    blocTest<EmployeeBloc, EmployeeState>(
      'harus emit [loading, loaded] saat berhasil',
      build: () {
        when(
          // ← ganti NoParams ke GetEmployeesParams
          () => mockGetEmployees(const GetEmployeesParams(page: 1)),
        ).thenAnswer((_) async => const Right(tEmployeeList));
        return bloc;
      },
      act: (bloc) => bloc.add(const EmployeeEvent.getEmployees()),
      expect: () => [
        const EmployeeState.loading(),
        // ← tambah hasReachedMax karena tEmployeeList.length < employeeLimit
        const EmployeeState.loaded(
          employees: tEmployeeList,
          filtered: tEmployeeList,
          currentPage: 1,
          hasReachedMax: true, // ← 1 item < 20 limit → hasReachedMax true
          isLoadingMore: false,
        ),
      ],
    );

    blocTest<EmployeeBloc, EmployeeState>(
      'harus emit [loading, error] saat gagal',
      build: () {
        when(
          () => mockGetEmployees(const GetEmployeesParams(page: 1)),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const EmployeeEvent.getEmployees()),
      expect: () => [
        const EmployeeState.loading(),
        const EmployeeState.error('Server error'),
      ],
    );
  });

  group('LoadMoreEmployeesEvent', () {
    blocTest<EmployeeBloc, EmployeeState>(
      'harus emit loaded dengan data tambahan saat load more berhasil',
      build: () {
        when(
          () => mockGetEmployees(const GetEmployeesParams(page: 2)),
        ).thenAnswer((_) async => const Right(tEmployeeList));
        return bloc;
      },
      seed: () => const EmployeeState.loaded(
        employees: tEmployeeList,
        filtered: tEmployeeList,
        currentPage: 1,
        hasReachedMax: false,
        isLoadingMore: false,
      ),
      act: (bloc) => bloc.add(const EmployeeEvent.loadMore()),
      expect: () => [
        // ← isLoadingMore true dulu
        const EmployeeState.loaded(
          employees: tEmployeeList,
          filtered: tEmployeeList,
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: true,
        ),
        // ← data bertambah
        const EmployeeState.loaded(
          employees: [...tEmployeeList, ...tEmployeeList],
          filtered: [...tEmployeeList, ...tEmployeeList],
          currentPage: 2,
          hasReachedMax: true, // ← 1 item < 20 limit
          isLoadingMore: false,
        ),
      ],
    );

    blocTest<EmployeeBloc, EmployeeState>(
      'tidak boleh load more jika hasReachedMax true',
      build: () => bloc,
      seed: () => const EmployeeState.loaded(
        employees: tEmployeeList,
        filtered: tEmployeeList,
        currentPage: 1,
        hasReachedMax: true, // ← sudah max
        isLoadingMore: false,
      ),
      act: (bloc) => bloc.add(const EmployeeEvent.loadMore()),
      expect: () => [], // ← tidak emit apapun
    );
  });

  group('SearchEmployeeEvent', () {
    blocTest<EmployeeBloc, EmployeeState>(
      'harus filter employee berdasarkan query yang cocok',
      build: () => bloc,
      seed: () => const EmployeeState.loaded(
        employees: tEmployeeList,
        filtered: tEmployeeList,
        currentPage: 1,
        hasReachedMax: false,
        isLoadingMore: false,
      ),
      act: (bloc) => bloc.add(const EmployeeEvent.search('zzzzz')),
      expect: () => [
        const EmployeeState.loaded(
          employees: tEmployeeList,
          filtered: [],
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: false,
        ),
      ],
    );

    blocTest<EmployeeBloc, EmployeeState>(
      'harus return list kosong jika query tidak ditemukan',
      build: () => bloc,
      seed: () => const EmployeeState.loaded(
        employees: tEmployeeList,
        filtered: tEmployeeList,
        currentPage: 1,
        hasReachedMax: false,
        isLoadingMore: false,
      ),
      act: (bloc) => bloc.add(const EmployeeEvent.search('zzzzz')),
      expect: () => [
        const EmployeeState.loaded(
          employees: tEmployeeList,
          filtered: [],
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: false,
        ),
      ],
    );

    blocTest<EmployeeBloc, EmployeeState>(
      'harus return semua employee jika query kosong',
      build: () => bloc,
      seed: () => const EmployeeState.loaded(
        employees: tEmployeeList,
        filtered: [],
        currentPage: 1,
        hasReachedMax: false,
        isLoadingMore: false,
      ),
      act: (bloc) => bloc.add(const EmployeeEvent.search('')),
      expect: () => [
        const EmployeeState.loaded(
          employees: tEmployeeList,
          filtered: tEmployeeList,
          currentPage: 1,
          hasReachedMax: false,
          isLoadingMore: false,
        ),
      ],
    );
  });
}
