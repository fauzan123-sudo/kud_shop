import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_event.freezed.dart';

@freezed
abstract class AddressEvent with _$AddressEvent {
  const factory AddressEvent.load() = AddressLoad;
  const factory AddressEvent.create({
    required String recipientName,
    required String phone,
    required String address,
    @Default(false) bool isDefault,
  }) = AddressCreate;
  const factory AddressEvent.update({
    required int id,
    required String recipientName,
    required String phone,
    required String address,
  }) = AddressUpdate;
  const factory AddressEvent.delete({required int id}) = AddressDelete;
  const factory AddressEvent.setDefault({required int id}) = AddressSetDefault;
}
