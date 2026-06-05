import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/src/auth/domain/repositories/auth_repository.dart';
import 'package:kud_shop/src/auth/domain/usecases/login.dart';
import 'package:kud_shop/src/auth/domain/usecases/logout.dart';
import 'package:kud_shop/src/auth/domain/usecases/register.dart';
import 'package:kud_shop/src/auth/domain/usecases/get_current_user.dart';
import 'package:kud_shop/src/auth/data/datasources/auth_supabase_datasource.dart';

// Auth
class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthSupabaseDataSource extends Mock
    implements AuthSupabaseDataSource {}

class MockLogin extends Mock implements Login {}

class MockLogout extends Mock implements Logout {}

class MockRegister extends Mock implements Register {}

class MockGetCurrentUser extends Mock implements GetCurrentUser {}
