import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../entities/address_entity.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressEntity>>> getAddresses();

  Future<Either<Failure, AddressEntity>> createAddress({
    required String recipientName,
    required String phone,
    required String address,
    bool isDefault = false,
  });

  Future<Either<Failure, AddressEntity>> updateAddress({
    required int id,
    required String recipientName,
    required String phone,
    required String address,
  });

  Future<Either<Failure, void>> deleteAddress({required int id});

  Future<Either<Failure, void>> setDefaultAddress({required int id});
}