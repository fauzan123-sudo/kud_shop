import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/address_entity.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    required int id,
    @JsonKey(name: 'recipient_name') required String recipientName,
    required String phone,
    required String address,
    @JsonKey(name: 'is_default') required bool isDefault,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

extension AddressModelX on AddressModel {
  AddressEntity toEntity() => AddressEntity(
    id: id,
    recipientName: recipientName,
    phone: phone,
    address: address,
    isDefault: isDefault,
  );
}
