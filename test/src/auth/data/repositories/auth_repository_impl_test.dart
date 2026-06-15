import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/auth/data/repositories/auth_repository_impl.dart';

import '../../../../helpers/mock_helper.dart';

import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/auth/data/models/user_model.dart';
import 'package:kud_shop/src/auth/domain/entities/user_entity.dart';

// ─── Fixture ─────────────────────────────────────────────────────────────────
const tUserModel = UserModel(
  id: 'test-uuid-1234',
  name: 'Ahmad Dwy Fauzan',
  email: 'damhadamha47@gmail.com',
  role: 'customer',
);

const tUser = UserEntity(
  id: 'test-uuid-1234',
  name: 'Ahmad Dwy Fauzan',
  email: 'damhadamha47@gmail.com',
  role: 'customer',
);

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthSupabaseDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAuthSupabaseDataSource();
    repository = AuthRepositoryImpl(dataSource: mockDataSource);
  });

  // ─── login ────────────────────────────────────────────────────────────────
  group('login', () {
    test('harus mengembalikan UserEntity saat login berhasil', () async {
      when(
        () => mockDataSource.login(
          email: 'damhadamha47@gmail.com',
          password: 'password123',
        ),
      ).thenAnswer((_) async => tUserModel);

      final result = await repository.login(
        email: 'damhadamha47@gmail.com',
        password: 'password123',
      );

      expect(result, const Right(tUser));
      verify(
        () => mockDataSource.login(
          email: 'damhadamha47@gmail.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test('harus mengembalikan ServerFailure saat kredensial salah', () async {
      // ← throw ServerException karena datasource sudah map AuthException → ServerException
      when(
        () => mockDataSource.login(
          email: 'damhadamha47@gmail.com',
          password: 'salah',
        ),
      ).thenThrow(ServerException(message: 'Email atau password salah'));

      final result = await repository.login(
        email: 'damhadamha47@gmail.com',
        password: 'salah',
      );

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ServerFailure>());
        expect(failure.message, 'Email atau password salah');
      }, (_) => fail('seharusnya Left bukan Right'));
    });
  });

  // ─── register ─────────────────────────────────────────────────────────────
  group('register', () {
    test('harus mengembalikan UserEntity saat register berhasil', () async {
      when(
        () => mockDataSource.register(
          name: 'Ahmad Dwy Fauzan',
          email: 'damhadamha47@gmail.com',
          password: 'password123',
        ),
      ).thenAnswer((_) async => tUserModel);

      final result = await repository.register(
        name: 'Ahmad Dwy Fauzan',
        email: 'damhadamha47@gmail.com',
        password: 'password123',
      );

      expect(result, const Right(tUser));
      verify(
        () => mockDataSource.register(
          name: 'Ahmad Dwy Fauzan',
          email: 'damhadamha47@gmail.com',
          password: 'password123',
        ),
      ).called(1);
    });

    test(
      'harus mengembalikan ServerFailure saat email sudah terdaftar',
      () async {
        when(
          () => mockDataSource.register(
            name: 'Ahmad Dwy Fauzan',
            email: 'damhadamha47@gmail.com',
            password: 'password123',
          ),
        ).thenThrow(
          // ← pesan sudah di-map oleh _mapAuthError di datasource
          ServerException(message: 'Email sudah terdaftar'),
        );

        final result = await repository.register(
          name: 'Ahmad Dwy Fauzan',
          email: 'damhadamha47@gmail.com',
          password: 'password123',
        );

        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.message, 'Email sudah terdaftar');
        }, (_) => fail('seharusnya Left bukan Right'));
      },
    );

    test(
      'harus mengembalikan ServerFailure saat password terlalu pendek',
      () async {
        when(
          () => mockDataSource.register(
            name: 'Ahmad Dwy Fauzan',
            email: 'damhadamha47@gmail.com',
            password: 'password123',
          ),
        ).thenThrow(ServerException(message: 'Password minimal 8 karakter'));

        final result = await repository.register(
          name: 'Ahmad Dwy Fauzan',
          email: 'damhadamha47@gmail.com',
          password: 'password123',
        );

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure.message, 'Password minimal 8 karakter'),
          (_) => fail('seharusnya Left bukan Right'),
        );
      },
    );
  });

  // ─── logout ───────────────────────────────────────────────────────────────
  group('logout', () {
    test('harus mengembalikan Right(null) saat logout berhasil', () async {
      when(() => mockDataSource.logout()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, const Right(null));
      verify(() => mockDataSource.logout()).called(1);
    });

    test('harus mengembalikan ServerFailure saat logout gagal', () async {
      when(() => mockDataSource.logout()).thenThrow(
        ServerException(message: 'Terjadi kesalahan, silakan coba lagi'),
      );

      final result = await repository.logout();

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ServerFailure>());
        expect(failure.message, 'Terjadi kesalahan, silakan coba lagi');
      }, (_) => fail('seharusnya Left bukan Right'));
    });
  });

  // ─── getCurrentUser ───────────────────────────────────────────────────────
  group('getCurrentUser', () {
    test('harus mengembalikan UserEntity saat ada session aktif', () async {
      when(
        () => mockDataSource.getCurrentUser(),
      ).thenAnswer((_) async => tUserModel);

      final result = await repository.getCurrentUser();

      expect(result, const Right(tUser));
      verify(() => mockDataSource.getCurrentUser()).called(1);
    });

    test(
      'harus mengembalikan UnauthorizedFailure saat tidak ada session',
      () async {
        // ← datasource throw UnauthorizedException saat currentUser == null
        when(
          () => mockDataSource.getCurrentUser(),
        ).thenThrow(UnauthorizedException());

        final result = await repository.getCurrentUser();

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<UnauthorizedFailure>()),
          (_) => fail('seharusnya Left bukan Right'),
        );
      },
    );

    test('harus mengembalikan ServerFailure saat gagal fetch profil', () async {
      when(
        () => mockDataSource.getCurrentUser(),
      ).thenThrow(ServerException(message: 'Gagal mengambil data user'));

      final result = await repository.getCurrentUser();

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<ServerFailure>());
        expect(failure.message, 'Gagal mengambil data user');
      }, (_) => fail('seharusnya Left bukan Right'));
    });
  });
}
