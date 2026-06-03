import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_ui_playground/src/profile/data/datasources/profile_local_datasource.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/core/network/network_info.dart';
import 'package:flutter_ui_playground/src/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ui_playground/src/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ui_playground/src/auth/domain/usecases/login.dart';
import 'package:flutter_ui_playground/src/auth/domain/usecases/logout.dart';
import 'package:flutter_ui_playground/src/employee/data/datasources/employee_local_datasource.dart'; // ← tambah
import 'package:flutter_ui_playground/src/employee/data/datasources/employee_remote_datasource.dart';
import 'package:flutter_ui_playground/src/employee/domain/repositories/employee_repository.dart';
import 'package:flutter_ui_playground/src/employee/domain/usecases/get_employees.dart';
import 'package:flutter_ui_playground/src/profile/data/datasources/profile_remote_datasource.dart';
import 'package:flutter_ui_playground/src/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_ui_playground/src/profile/domain/usecases/get_profile.dart';

// Core
class MockNetworkInfo extends Mock implements NetworkInfo {}
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

// Auth
class MockAuthRepository extends Mock implements AuthRepository {}
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
class MockLogin extends Mock implements Login {}
class MockLogout extends Mock implements Logout {}

// Employee
class MockEmployeeRepository extends Mock implements EmployeeRepository {}
class MockEmployeeRemoteDataSource extends Mock implements EmployeeRemoteDataSource {}
class MockEmployeeLocalDataSource extends Mock implements EmployeeLocalDataSource {} // ← tambah
class MockGetEmployees extends Mock implements GetEmployees {}

// Profile
class MockProfileRepository extends Mock implements ProfileRepository {}
class MockProfileRemoteDataSource extends Mock implements ProfileRemoteDataSource {}
class MockProfileLocalDataSource extends Mock implements ProfileLocalDataSource {} 
class MockGetProfile extends Mock implements GetProfile {}