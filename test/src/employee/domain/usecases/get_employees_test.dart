import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_playground/core/error/failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/src/employee/domain/usecases/get_employees.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late GetEmployees useCase;
  late MockEmployeeRepository mockRepository;

  setUp(() {
    mockRepository = MockEmployeeRepository();
    useCase = GetEmployees(mockRepository);
  });

  test('harus mengembalikan List<Employee> saat berhasil', () async {
    // arrange
    when(
      () => mockRepository.getEmployees(page: 1), // ← tambah page: 1
    ).thenAnswer((_) async => const Right(tEmployeeList));

    // act
    final result = await useCase(
      const GetEmployeesParams(page: 1),
    ); // ← ganti NoParams

    // assert
    expect(result, const Right(tEmployeeList));
    verify(
      () => mockRepository.getEmployees(page: 1),
    ).called(1); // ← tambah page: 1
    verifyNoMoreInteractions(mockRepository);
  });

  test('harus mengembalikan NetworkFailure saat tidak ada koneksi', () async {
    // arrange
    when(
      () => mockRepository.getEmployees(page: 1), // ← tambah page: 1
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    // act
    final result = await useCase(
      const GetEmployeesParams(page: 1),
    ); // ← ganti NoParams

    // assert
    expect(result, const Left(NetworkFailure()));
  });

  test('harus mengembalikan List<Employee> saat load more halaman 2', () async {
    // ← tambah test untuk load more
    when(
      () => mockRepository.getEmployees(page: 2),
    ).thenAnswer((_) async => const Right(tEmployeeList));

    final result = await useCase(const GetEmployeesParams(page: 2));

    expect(result, const Right(tEmployeeList));
    verify(() => mockRepository.getEmployees(page: 2)).called(1);
  });
}
