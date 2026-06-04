import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = AuthStarted;

  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = AuthLoginRequested;

  const factory AuthEvent.register({
    required String name,
    required String email,
    required String password,
  }) = AuthRegisterRequested;

  const factory AuthEvent.logout() = AuthLogoutRequested;
}