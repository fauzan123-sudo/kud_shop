import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_supabase_datasource.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressSupabaseDataSource dataSource;

  AddressRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      final result = await dataSource.getAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> createAddress({
    required String recipientName,
    required String phone,
    required String address,
    bool isDefault = false,
  }) async {
    try {
      final result = await dataSource.createAddress(
        recipientName: recipientName,
        phone: phone,
        address: address,
        isDefault: isDefault,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> updateAddress({
    required int id,
    required String recipientName,
    required String phone,
    required String address,
  }) async {
    try {
      final result = await dataSource.updateAddress(
        id: id,
        recipientName: recipientName,
        phone: phone,
        address: address,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress({required int id}) async {
    try {
      await dataSource.deleteAddress(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultAddress({required int id}) async {
    try {
      await dataSource.setDefaultAddress(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }
}