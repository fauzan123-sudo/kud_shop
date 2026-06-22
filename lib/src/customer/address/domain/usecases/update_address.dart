import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class UpdateAddress extends UseCase<AddressEntity, UpdateAddressParams> {
  final AddressRepository repository;
  UpdateAddress(this.repository);

  @override
  Future<Either<Failure, AddressEntity>> call(UpdateAddressParams params) {
    return repository.updateAddress(
      id: params.id,
      recipientName: params.recipientName,
      phone: params.phone,
      address: params.address,
    );
  }
}

class UpdateAddressParams extends Equatable {
  final int id;
  final String recipientName;
  final String phone;
  final String address;

  const UpdateAddressParams({
    required this.id,
    required this.recipientName,
    required this.phone,
    required this.address,
  });

  @override
  List<Object> get props => [id, recipientName, phone, address];
}