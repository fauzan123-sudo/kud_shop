import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/address_repository.dart';

class SetDefaultAddress extends UseCase<void, SetDefaultAddressParams> {
  final AddressRepository repository;
  SetDefaultAddress(this.repository);

  @override
  Future<Either<Failure, void>> call(SetDefaultAddressParams params) {
    return repository.setDefaultAddress(id: params.id);
  }
}

class SetDefaultAddressParams extends Equatable {
  final int id;
  const SetDefaultAddressParams({required this.id});

  @override
  List<Object> get props => [id];
}