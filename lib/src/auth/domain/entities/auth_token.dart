import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';

@freezed
abstract class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required String refreshToken,
    required int    id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
  }) = _AuthToken;

  const AuthToken._();
  String get fullName => '$firstName $lastName';
}