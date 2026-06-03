import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int    id,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName')  required String lastName,
    required String email,
    required String phone,
    required String image,
    @JsonKey(name: 'company') required Map<String, dynamic> company,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelX on ProfileModel {
  Profile toEntity() => Profile(
        id:         id,
        name:       '$firstName $lastName'.trim(),
        email:      email,
        phone:      phone,
        position:   (company['title']      as String?) ?? '',
        department: (company['department'] as String?) ?? '',
        avatarUrl:  image,
      );
}