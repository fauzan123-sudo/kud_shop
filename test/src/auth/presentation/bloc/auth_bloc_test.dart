import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';
import 'package:kud_shop/src/auth/domain/usecases/register.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_event.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_state.dart';

import '../../../../helpers/mock_helper.dart';
import '../../../../helpers/test_helper.dart';

void main() {
  late AuthBloc bloc;
  late MockLogin mockLogin;
  late MockLogout mockLogout;
  late MockRegister mockRegister;
  late MockGetCurrentUser mockGetCurrentUser;

  setUp(() {
    mockLogin = MockLogin();
    mockLogout = MockLogout();
    mockRegister = MockRegister();
    mockGetCurrentUser = MockGetCurrentUser();
    bloc = AuthBloc(
      login: mockLogin,
      logout: mockLogout,
      register: mockRegister,
      getCurrentUser: mockGetCurrentUser,
    );
  });

  tearDown(() => bloc.close());

  test('initial state harus AuthInitial', () {
    expect(bloc.state, const AuthState.initial());
  });

  // ─── AuthStarted ──────────────────────────────────────────
  group('AuthStarted', () {
    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, authenticated] saat ada session aktif',
      build: () {
        when(
          () => mockGetCurrentUser(const NoParams()),
        ).thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.started()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.authenticated(tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, unauthenticated] saat tidak ada session',
      build: () {
        when(
          () => mockGetCurrentUser(const NoParams()),
        ).thenAnswer((_) async => const Left(ServerFailure('No session')));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.started()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
      ],
    );
  });

  // ─── LoginEvent ───────────────────────────────────────────
  group('AuthLoginRequested', () {
    const tParams = LoginParams(
      email: 'fauzan@gmail.com',
      password: 'password123',
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, authenticated] saat login berhasil',
      build: () {
        when(
          () => mockLogin(tParams),
        ).thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.login(
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.authenticated(tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat login gagal kredensial salah',
      build: () {
        when(() => mockLogin(tParams)).thenAnswer(
          (_) async => const Left(ServerFailure('Invalid login credentials')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.login(
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Invalid login credentials'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat tidak ada koneksi',
      build: () {
        when(
          () => mockLogin(tParams),
        ).thenAnswer((_) async => const Left(NetworkFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.login(
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Tidak ada koneksi internet'),
      ],
    );
  });

  // ─── RegisterEvent ────────────────────────────────────────
  group('AuthRegisterRequested', () {
    const tParams = RegisterParams(
      name: 'Ahmad Fauzan',
      email: 'fauzan@gmail.com',
      password: 'password123',
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, registerSuccess] saat register berhasil',
      build: () {
        when(
          () => mockRegister(tParams),
        ).thenAnswer((_) async => const Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.register(
          name: 'Ahmad Fauzan',
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.registerSuccess(tUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat email sudah terdaftar',
      build: () {
        when(() => mockRegister(tParams)).thenAnswer(
          (_) async => const Left(ServerFailure('User already registered')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.register(
          name: 'Ahmad Fauzan',
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('User already registered'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat password terlalu lemah',
      build: () {
        when(() => mockRegister(tParams)).thenAnswer(
          (_) async => const Left(
            ServerFailure('Password should be at least 6 characters'),
          ),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.register(
          name: 'Ahmad Fauzan',
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Password should be at least 6 characters'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat tidak ada koneksi',
      build: () {
        when(
          () => mockRegister(tParams),
        ).thenAnswer((_) async => const Left(NetworkFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.register(
          name: 'Ahmad Fauzan',
          email: 'fauzan@gmail.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Tidak ada koneksi internet'),
      ],
    );
  });

  // ─── LogoutEvent ──────────────────────────────────────────
  group('AuthLogoutRequested', () {
    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, unauthenticated] saat logout berhasil',
      build: () {
        when(
          () => mockLogout(const NoParams()),
        ).thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.logout()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'harus emit [loading, error] saat logout gagal',
      build: () {
        when(
          () => mockLogout(const NoParams()),
        ).thenAnswer((_) async => const Left(ServerFailure('Logout failed')));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.logout()),
      expect: () => [
        const AuthState.loading(),
        const AuthState.error('Logout failed'),
      ],
    );
  });
}
