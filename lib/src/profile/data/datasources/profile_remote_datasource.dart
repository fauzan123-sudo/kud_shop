import 'package:dio/dio.dart';
import 'package:flutter_ui_playground/core/constants/api_endpoints.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;
  ProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await dio.get(ApiEndpoints.me);
    return ProfileModel.fromJson(response.data);
  }
}
