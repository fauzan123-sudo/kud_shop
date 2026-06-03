import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required int    id,
    required String name,
    required String email,
    required String phone,
    required String position,
    required String department,
    required String avatarUrl,
  }) = _Profile;
}