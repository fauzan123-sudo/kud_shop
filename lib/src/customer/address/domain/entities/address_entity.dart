import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';

@freezed
abstract class AddressEntity with _$AddressEntity {
  const factory AddressEntity({
    required int id,
    required String recipientName,
    required String phone,
    required String address,
    required bool isDefault,
  }) = _AddressEntity;
}