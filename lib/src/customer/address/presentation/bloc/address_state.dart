import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/address_entity.dart';

part 'address_state.freezed.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState.initial() = AddressInitial;
  const factory AddressState.loading() = AddressLoading;
  const factory AddressState.loaded(List<AddressEntity> addresses) = AddressLoaded;
  const factory AddressState.actionSuccess(
    List<AddressEntity> addresses,
    String message,
  ) = AddressActionSuccess;
  const factory AddressState.error(String message) = AddressError;
}

extension AddressLoadedX on AddressLoaded {
  bool get isEmpty => addresses.isEmpty;
}