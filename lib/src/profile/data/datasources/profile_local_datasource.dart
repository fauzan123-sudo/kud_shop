import 'dart:convert';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../../../core/constants/hive_keys.dart';
import '../../../../core/error/exception.dart';
import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getCachedProfile();
  Future<void> cacheProfile(ProfileModel profile);
  Future<void> clearCache();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final Box<String> box;

  ProfileLocalDataSourceImpl(this.box);

  @override
  Future<ProfileModel> getCachedProfile() async {
    final jsonString = box.get(HiveKeys.cachedProfile);

    if (jsonString == null) throw CacheException();

    return ProfileModel.fromJson(
      Map<String, dynamic>.from(
        json.decode(jsonString) as Map,
      ),
    );
  }

  @override
  Future<void> cacheProfile(ProfileModel profile) async {
    final safeJson = _toSafeJson(profile);
    box.put(HiveKeys.cachedProfile, json.encode(safeJson));
  }

  @override
  Future<void> clearCache() async {
    box.delete(HiveKeys.cachedProfile);
  }

  Map<String, dynamic> _toSafeJson(ProfileModel p) {
    return {
      'id':        p.id,
      'firstName': p.firstName,
      'lastName':  p.lastName,
      'email':     p.email,
      'phone':     p.phone,
      'image':     p.image,
      'company':   Map<String, dynamic>.from(p.company),
    };
  }
}