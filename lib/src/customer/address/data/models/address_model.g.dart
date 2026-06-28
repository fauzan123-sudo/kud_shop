// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: (json['id'] as num).toInt(),
      recipientName: json['recipient_name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      isDefault: json['is_default'] as bool,
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipient_name': instance.recipientName,
      'phone': instance.phone,
      'address': instance.address,
      'is_default': instance.isDefault,
    };
