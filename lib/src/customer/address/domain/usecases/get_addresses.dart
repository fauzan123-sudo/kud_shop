import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class GetAddresses extends UseCase<List<AddressEntity>, NoParams> {
  final AddressRepository repository;
  GetAddresses(this.repository);

  @override
  Future<Either<Failure, List<AddressEntity>>> call(NoParams params) {
    return repository.getAddresses();
  }
}
