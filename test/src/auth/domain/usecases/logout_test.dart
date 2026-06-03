import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/auth/domain/usecases/logout.dart';

import '../../../../helpers/mock_helper.dart';

void main() {
  late Logout useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = Logout(mockRepository);
  });

  test('harus memanggil repository.logout', () async {
    // arrange
    when(() => mockRepository.logout())
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, const Right(null));
    verify(() => mockRepository.logout()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}