import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/core/error/failure.dart';
import 'package:flutter_ui_playground/core/usecases/usecase.dart';
import 'package:flutter_ui_playground/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_ui_playground/src/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_ui_playground/src/profile/presentation/bloc/profile_state.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late ProfileBloc bloc;
  late MockGetProfile mockGetProfile;

  setUp(() {
    mockGetProfile = MockGetProfile();
    bloc = ProfileBloc(mockGetProfile);
  });

  tearDown(() => bloc.close());

  test('initial state harus ProfileInitial', () {
    expect(bloc.state, const ProfileState.initial());
  });

  group('GetProfileEvent', () {
    blocTest<ProfileBloc, ProfileState>(
      'harus emit [loading, loaded] saat berhasil',
      build: () {
        when(() => mockGetProfile(const NoParams()))
            .thenAnswer((_) async => const Right(tProfile));
        return bloc;
      },
      act: (bloc) => bloc.add(const ProfileEvent.getProfile()),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.loaded(tProfile),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'harus emit [loading, error] saat gagal',
      build: () {
        when(() => mockGetProfile(const NoParams())).thenAnswer(
          (_) async => const Left(NetworkFailure()),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const ProfileEvent.getProfile()),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.error('Tidak ada koneksi internet'),
      ],
    );
  });
}