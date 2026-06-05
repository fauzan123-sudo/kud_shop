import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late Login useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = Login(mockRepository);
  });

  const tParams = LoginParams(
    email: 'fauzan@gmail.com',
    password: 'password123',
  );

  test('harus mengembalikan UserEntity saat login berhasil', () async {
    when(
      () => mockRepository.login(
        email: tParams.email,
        password: tParams.password,
      ),
    ).thenAnswer((_) async => const Right(tUser));

    final result = await useCase(tParams);

    expect(result, const Right(tUser));
    verify(
      () => mockRepository.login(
        email: tParams.email,
        password: tParams.password,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('harus mengembalikan ServerFailure saat kredensial salah', () async {
    when(
      () => mockRepository.login(
        email: tParams.email,
        password: tParams.password,
      ),
    ).thenAnswer(
      (_) async => const Left(ServerFailure('Invalid login credentials')),
    );

    final result = await useCase(tParams);

    expect(result, const Left(ServerFailure('Invalid login credentials')));
  });

  test('harus mengembalikan NetworkFailure saat tidak ada koneksi', () async {
    when(
      () => mockRepository.login(
        email: tParams.email,
        password: tParams.password,
      ),
    ).thenAnswer((_) async => const Left(NetworkFailure()));

    final result = await useCase(tParams);

    expect(result, const Left(NetworkFailure()));
  });
}
