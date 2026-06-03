import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/profile/domain/usecases/get_profile.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late GetProfile useCase;
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = GetProfile(mockRepository);
  });

  test('harus mengembalikan Profile saat berhasil', () async {
    // arrange
    when(() => mockRepository.getProfile())
        .thenAnswer((_) async => const Right(tProfile));

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, const Right(tProfile));
    verify(() => mockRepository.getProfile()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('harus mengembalikan Failure saat gagal', () async {
    // arrange
    when(() => mockRepository.getProfile()).thenAnswer(
      (_) async => const Left(ServerFailure('Server error')),
    );

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, const Left(ServerFailure('Server error')));
  });
}