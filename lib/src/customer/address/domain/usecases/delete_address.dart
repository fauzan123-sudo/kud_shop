import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/address_repository.dart';

class DeleteAddress extends UseCase<void, DeleteAddressParams> {
  final AddressRepository repository;
  DeleteAddress(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteAddressParams params) {
    return repository.deleteAddress(id: params.id);
  }
}

class DeleteAddressParams extends Equatable {
  final int id;
  const DeleteAddressParams({required this.id});

  @override
  List<Object> get props => [id];
}