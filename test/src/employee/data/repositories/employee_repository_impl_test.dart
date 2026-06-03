import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/core/error/exception.dart';
import 'package:flutter_ui_playground/core/error/failure.dart';
import 'package:flutter_ui_playground/src/employee/data/models/employee_model.dart';
import 'package:flutter_ui_playground/src/employee/data/repositories/employee_repository_impl.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

class FakeEmployeeModel extends Fake implements EmployeeModel {}

void main() {
  late EmployeeRepositoryImpl repository;
  late MockEmployeeRemoteDataSource mockRemoteDataSource;
  late MockEmployeeLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    registerFallbackValue(FakeEmployeeModel());
  });

  setUp(() {
    mockRemoteDataSource = MockEmployeeRemoteDataSource();
    mockLocalDataSource = MockEmployeeLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = EmployeeRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    when(
      () => mockLocalDataSource.cacheEmployees(any()),
    ).thenAnswer((_) async {});
  });

  group('getEmployees', () {
    test('harus mengembalikan List<Employee> saat ada koneksi', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        () => mockRemoteDataSource.getEmployees(),
      ).thenAnswer((_) async => tEmployeeModelList);

      final result = await repository.getEmployees();

      expect(result.isRight(), true);
      result.fold((l) => fail('seharusnya Right bukan Left'), (employees) {
        expect(employees.length, tEmployeeList.length);
        expect(employees.first.id, tEmployee.id);
        expect(employees.first.name, tEmployee.name);
        expect(employees.first.email, tEmployee.email);
        expect(employees.first.phone, tEmployee.phone);
        expect(employees.first.position, tEmployee.position);
        expect(employees.first.department, tEmployee.department);
        expect(employees.first.avatarUrl, tEmployee.avatarUrl);
        expect(employees.first.isActive, tEmployee.isActive);
      });
    });

    test('harus mengembalikan data cache saat offline dan cache tersedia', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(
        () => mockLocalDataSource.getCachedEmployees(),
      ).thenAnswer((_) async => tEmployeeModelList);

      final result = await repository.getEmployees();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('seharusnya Right bukan Left'),
        (employees) => expect(employees.length, tEmployeeList.length),
      );
    });

    test('harus mengembalikan CacheFailure saat offline dan cache kosong', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(
        () => mockLocalDataSource.getCachedEmployees(),
      ).thenThrow(CacheException());

      final result = await repository.getEmployees();

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<CacheFailure>()),
        (r) => fail('seharusnya Left bukan Right'),
      );
    });

    test(
      'harus mengembalikan ServerFailure saat datasource throw exception',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          () => mockRemoteDataSource.getEmployees(),
        ).thenThrow(ServerException(message: 'Server error'));

        final result = await repository.getEmployees();

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (r) => fail('seharusnya Left bukan Right'),
        );
      },
    );
  });

  group('getEmployeeById', () {
    test('harus mengembalikan Employee saat ada koneksi', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        () => mockRemoteDataSource.getEmployeeById(1),
      ).thenAnswer((_) async => tEmployeeModel);

      final result = await repository.getEmployeeById(1);

      expect(result.isRight(), true);
      result.fold((l) => fail('seharusnya Right bukan Left'), (employee) {
        expect(employee.id, tEmployee.id);
        expect(employee.name, tEmployee.name);
        expect(employee.email, tEmployee.email);
        expect(employee.phone, tEmployee.phone);
        expect(employee.position, tEmployee.position);
        expect(employee.department, tEmployee.department);
        expect(employee.avatarUrl, tEmployee.avatarUrl);
        expect(employee.isActive, tEmployee.isActive);
      });
    });

    test('harus mengembalikan NetworkFailure saat tidak ada koneksi', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.getEmployeeById(1);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (r) => fail('seharusnya Left bukan Right'),
      );
    });

    test(
      'harus mengembalikan ServerFailure saat datasource throw exception',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          () => mockRemoteDataSource.getEmployeeById(1),
        ).thenThrow(ServerException(message: 'Not found'));

        final result = await repository.getEmployeeById(1);

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (r) => fail('seharusnya Left bukan Right'),
        );
      },
    );
  });
}