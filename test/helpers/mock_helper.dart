import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kud_shop/src/profile/data/datasources/profile_local_datasource.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/core/network/network_info.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_remote_datasource.dart';
import 'package:kud_shop/src/auth/domain/repositories/auth_repository.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';
import 'package:kud_shop/src/auth/domain/usecases/logout.dart';
import 'package:kud_shop/src/profile/data/datasources/profile_remote_datasource.dart';
import 'package:kud_shop/src/profile/domain/repositories/profile_repository.dart';
import 'package:kud_shop/src/profile/domain/usecases/get_profile.dart';

// Core
class MockNetworkInfo extends Mock implements NetworkInfo {}
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

// Auth
class MockAuthRepository extends Mock implements AuthRepository {}
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
class MockLogin extends Mock implements Login {}
class MockLogout extends Mock implements Logout {}

// Profile
class MockProfileRepository extends Mock implements ProfileRepository {}
class MockProfileRemoteDataSource extends Mock implements ProfileRemoteDataSource {}
class MockProfileLocalDataSource extends Mock implements ProfileLocalDataSource {} 
class MockGetProfile extends Mock implements GetProfile {}