import '../../domain/entities/address_entity.dart';

abstract class AddressState {
  const AddressState();
}

class AddressInitial extends AddressState {
  const AddressInitial();
}

class AddressLoading extends AddressState {
  const AddressLoading();
}

class AddressLoaded extends AddressState {
  final List<AddressEntity> addresses;

  const AddressLoaded(this.addresses);

  bool get isEmpty => addresses.isEmpty;
}

class AddressActionSuccess extends AddressState {
  final List<AddressEntity> addresses;
  final String message;

  const AddressActionSuccess(this.addresses, this.message);
}

class AddressError extends AddressState {
  final String message;
  const AddressError(this.message);
}