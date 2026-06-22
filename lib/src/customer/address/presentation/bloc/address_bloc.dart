import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../../domain/usecases/get_addresses.dart';
import '../../domain/usecases/create_address.dart';
import '../../domain/usecases/update_address.dart';
import '../../domain/usecases/delete_address.dart';
import '../../domain/usecases/set_default_address.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAddresses _getAddresses;
  final CreateAddress _createAddress;
  final UpdateAddress _updateAddress;
  final DeleteAddress _deleteAddress;
  final SetDefaultAddress _setDefaultAddress;

  AddressBloc({
    required GetAddresses getAddresses,
    required CreateAddress createAddress,
    required UpdateAddress updateAddress,
    required DeleteAddress deleteAddress,
    required SetDefaultAddress setDefaultAddress,
  })  : _getAddresses = getAddresses,
        _createAddress = createAddress,
        _updateAddress = updateAddress,
        _deleteAddress = deleteAddress,
        _setDefaultAddress = setDefaultAddress,
        super(const AddressInitial()) {
    on<AddressLoad>(_onLoad);
    on<AddressCreate>(_onCreate);
    on<AddressUpdate>(_onUpdate);
    on<AddressDelete>(_onDelete);
    on<AddressSetDefault>(_onSetDefault);
  }

  Future<void> _onLoad(AddressLoad event, Emitter<AddressState> emit) async {
    emit(const AddressLoading());
    final result = await _getAddresses(const NoParams());
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (addresses) => emit(AddressLoaded(addresses)),
    );
  }

  Future<void> _onCreate(
    AddressCreate event,
    Emitter<AddressState> emit,
  ) async {
    final result = await _createAddress(
      CreateAddressParams(
        recipientName: event.recipientName,
        phone: event.phone,
        address: event.address,
        isDefault: event.isDefault,
      ),
    );
    await result.fold(
      (failure) async => emit(AddressError(failure.message)),
      (_) async => _reloadWithMessage(emit, 'Alamat berhasil ditambahkan'),
    );
  }

  Future<void> _onUpdate(
    AddressUpdate event,
    Emitter<AddressState> emit,
  ) async {
    final result = await _updateAddress(
      UpdateAddressParams(
        id: event.id,
        recipientName: event.recipientName,
        phone: event.phone,
        address: event.address,
      ),
    );
    await result.fold(
      (failure) async => emit(AddressError(failure.message)),
      (_) async => _reloadWithMessage(emit, 'Alamat berhasil diperbarui'),
    );
  }

  Future<void> _onDelete(
    AddressDelete event,
    Emitter<AddressState> emit,
  ) async {
    final result = await _deleteAddress(DeleteAddressParams(id: event.id));
    await result.fold(
      (failure) async => emit(AddressError(failure.message)),
      (_) async => _reloadWithMessage(emit, 'Alamat berhasil dihapus'),
    );
  }

  Future<void> _onSetDefault(
    AddressSetDefault event,
    Emitter<AddressState> emit,
  ) async {
    final result = await _setDefaultAddress(
      SetDefaultAddressParams(id: event.id),
    );
    await result.fold(
      (failure) async => emit(AddressError(failure.message)),
      (_) async => _reloadWithMessage(emit, 'Alamat utama diperbarui'),
    );
  }

  Future<void> _reloadWithMessage(
    Emitter<AddressState> emit,
    String message,
  ) async {
    final result = await _getAddresses(const NoParams());
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (addresses) => emit(AddressActionSuccess(addresses, message)),
    );
  }
}