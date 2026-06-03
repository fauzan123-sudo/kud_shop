import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/core/error/failure.dart';
import 'package:flutter_ui_playground/core/usecases/usecase.dart';
import 'package:flutter_ui_playground/src/auth/domain/usecases/login.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_state.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';


void main() {
  late AuthBloc bloc;
  late MockLogin mockLogin;
  late MockLogout mockLogout;

  setUp(() {
    mockLogin  = MockLogin();
    mockLogout = MockLogout();
    bloc = AuthBloc(login: mockLogin, logout: mockLogout);
  });

  tearDown(() => bloc.close());

  test('initial state harus AuthInitial', () {
    expect(bloc.state, const AuthState.initial());
  });

  group('LoginEvent', () {
    const tParams = LoginParams(
      username: 'emilys',
      password: 'emilyspass',
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, authenticated] saat login berhasil',
      build: () {
        when(() => mockLogin(tParams))
            .thenAnswer((_) async => const Right(tAuthToken));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.login(username: 'emilys', password: 'emilyspass'),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.authenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat login gagal',
      build: () {
        when(() => mockLogin(tParams)).thenAnswer(
          (_) async => const Left(ServerFailure('Invalid credentials')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.login(username: 'emilys', password: 'emilyspass'),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Invalid credentials'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat tidak ada koneksi',
      build: () {
        when(() => mockLogin(tParams)).thenAnswer(
          (_) async => const Left(NetworkFailure()),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.login(username: 'emilys', password: 'emilyspass'),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Tidak ada koneksi internet'),
      ],
    );
  });

  group('LogoutEvent', () {
    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, unauthenticated] saat logout berhasil',
      build: () {
        when(() => mockLogout(const NoParams()))
            .thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.logout()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
      ],
    );
  });
}