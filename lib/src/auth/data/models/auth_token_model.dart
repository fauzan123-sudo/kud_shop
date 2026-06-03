import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_token.dart';

part 'auth_token_model.freezed.dart';
part 'auth_token_model.g.dart';

@freezed
abstract class AuthTokenModel with _$AuthTokenModel {
  const factory AuthTokenModel({
    @JsonKey(name: 'accessToken')  required String accessToken,
    @JsonKey(name: 'refreshToken') required String refreshToken,
    required int    id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);
}

extension AuthTokenModelX on AuthTokenModel {
  AuthToken toEntity() => AuthToken(
        accessToken:  accessToken,
        refreshToken: refreshToken,
        id:           id,
        username:     username,
        email:        email,
        firstName:    firstName,
        lastName:     lastName,
      );
}