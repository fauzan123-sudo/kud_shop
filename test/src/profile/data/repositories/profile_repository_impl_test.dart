import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/profile/data/models/profile_model.dart';
import 'package:kud_shop/src/profile/data/repositories/profile_repository_impl.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

class FakeProfileModel extends Fake implements ProfileModel {}

void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockProfileLocalDataSource mockLocalDataSource;

  setUpAll(() {
    registerFallbackValue(FakeProfileModel());
  });

  setUp(() {
    mockRemoteDataSource = MockProfileRemoteDataSource();
    mockLocalDataSource = MockProfileLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProfileRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    when(
      () => mockLocalDataSource.cacheProfile(any()),
    ).thenAnswer((_) async {});
  });

  group('getProfile', () {
    test('harus mengembalikan Profile saat ada koneksi', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        () => mockRemoteDataSource.getProfile(),
      ).thenAnswer((_) async => tProfileModel);

      final result = await repository.getProfile();

      expect(result.isRight(), true);
      result.fold((l) => fail('seharusnya Right bukan Left'), (profile) {
        expect(profile.id, tProfile.id);
        expect(profile.name, tProfile.name);
        expect(profile.email, tProfile.email);
        expect(profile.phone, tProfile.phone);
        expect(profile.position, tProfile.position);
        expect(profile.department, tProfile.department);
        expect(profile.avatarUrl, tProfile.avatarUrl);
      });
    });

    test(
      'harus mengembalikan data cache saat offline dan cache tersedia',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(
          () => mockLocalDataSource.getCachedProfile(),
        ).thenAnswer((_) async => tProfileModel);

        final result = await repository.getProfile();

        expect(result.isRight(), true);
        result.fold((l) => fail('seharusnya Right bukan Left'), (profile) {
          expect(profile.id, tProfile.id);
          expect(profile.name, tProfile.name);
        });
      },
    );

    test(
      'harus mengembalikan CacheFailure saat offline dan cache kosong',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(
          () => mockLocalDataSource.getCachedProfile(),
        ).thenThrow(CacheException());

        final result = await repository.getProfile();

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<CacheFailure>()),
          (r) => fail('seharusnya Left bukan Right'),
        );
      },
    );

    test(
      'harus mengembalikan ServerFailure saat datasource throw exception',
      () async {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          () => mockRemoteDataSource.getProfile(),
        ).thenThrow(ServerException(message: 'Server error'));

        final result = await repository.getProfile();

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (r) => fail('seharusnya Left bukan Right'),
        );
      },
    );
  });
}
