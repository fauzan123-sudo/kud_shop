import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/auth/data/repositories/auth_repository_impl.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockFlutterSecureStorage mockStorage; 

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockStorage = MockFlutterSecureStorage(); 
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      storage: mockStorage, // ← ganti dari MockFlutterSecureStorage() langsung
      networkInfo: mockNetworkInfo,
    );

    // Setup default mock untuk storage write
    when(
      () => mockStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
  });

  group('login', () {
    test(
      'harus mengembalikan AuthToken saat ada koneksi dan berhasil',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          () => mockRemoteDataSource.login(
            username: 'emilys',
            password: 'emilyspass',
          ),
        ).thenAnswer((_) async => tAuthTokenModel);

        final result = await repository.login(
          username: 'emilys',
          password: 'emilyspass',
        );

        expect(result, const Right(tAuthToken));
      },
    );

    test('harus mengembalikan NetworkFailure saat tidak ada koneksi', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.login(
        username: 'emilys',
        password: 'emilyspass',
      );

      expect(result, const Left(NetworkFailure()));
      verifyNever(
        () => mockRemoteDataSource.login(
          username: any(named: 'username'),
          password: any(named: 'password'),
        ),
      );
    });
  });

  group('logout', () {
    test('harus menghapus semua storage saat logout', () async {
      when(() => mockStorage.deleteAll()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, const Right(null));
      verify(() => mockStorage.deleteAll()).called(1);
    });
  });
}
