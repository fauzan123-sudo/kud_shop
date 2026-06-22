import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class CreateAddress extends UseCase<AddressEntity, CreateAddressParams> {
  final AddressRepository repository;
  CreateAddress(this.repository);

  @override
  Future<Either<Failure, AddressEntity>> call(CreateAddressParams params) {
    return repository.createAddress(
      recipientName: params.recipientName,
      phone: params.phone,
      address: params.address,
      isDefault: params.isDefault,
    );
  }
}

class CreateAddressParams extends Equatable {
  final String recipientName;
  final String phone;
  final String address;
  final bool isDefault;

  const CreateAddressParams({
    required this.recipientName,
    required this.phone,
    required this.address,
    this.isDefault = false,
  });

  @override
  List<Object> get props => [recipientName, phone, address, isDefault];
}