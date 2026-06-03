import 'package:dio/dio.dart';
import '../models/employee_model.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/constants/app_constants.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<EmployeeModel>> getEmployees({int page = 1}); // ← tambah page
  Future<EmployeeModel> getEmployeeById(int id);
}

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final Dio dio;
  EmployeeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<EmployeeModel>> getEmployees({int page = 1}) async {
    final skip = (page - 1) * AppConstants.employeeLimit; // ← hitung skip
    final response = await dio.get(
      ApiEndpoints.users,
      queryParameters: {
        'limit': AppConstants.employeeLimit,
        'skip': skip, // ← tambah skip untuk pagination
      },
    );
    final List<dynamic> data = response.data['users'];
    return data.map((e) => EmployeeModel.fromJson(e)).toList();
  }

  @override
  Future<EmployeeModel> getEmployeeById(int id) async {
    final response = await dio.get(ApiEndpoints.userById(id));
    return EmployeeModel.fromJson(response.data);
  }
}
