import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String name,
    required String role,
    String? phone,
    String? avatarUrl,
  }) = _UserEntity;

  const UserEntity._();

  bool get isAdmin => role == 'admin';
  bool get isCustomer => role == 'customer';
}