import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:mocktail/mocktail.dart';
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
    username: 'emilys',
    password: 'emilyspass',
  );

  test('harus mengembalikan AuthToken saat login berhasil', () async {
    // arrange
    when(() => mockRepository.login(
          username: tParams.username,
          password: tParams.password,
        )).thenAnswer((_) async => const Right(tAuthToken));

    // act
    final result = await useCase(tParams);

    // assert
    expect(result, const Right(tAuthToken));
    verify(() => mockRepository.login(
          username: tParams.username,
          password: tParams.password,
        )).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('harus mengembalikan Failure saat login gagal', () async {
    // arrange
    when(() => mockRepository.login(
          username: tParams.username,
          password: tParams.password,
        )).thenAnswer((_) async => const Left(ServerFailure('Invalid credentials')));

    // act
    final result = await useCase(tParams);

    // assert
    expect(result, const Left(ServerFailure('Invalid credentials')));
  });
}