import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_playground/core/injection/injection.dart';
import 'package:flutter_ui_playground/core/usecases/usecase.dart';
import 'package:flutter_ui_playground/src/auth/domain/usecases/login.dart';
import 'package:flutter_ui_playground/src/auth/domain/usecases/logout.dart';
import 'package:flutter_ui_playground/src/employee/domain/usecases/get_employees.dart';
import 'package:flutter_ui_playground/src/profile/domain/usecases/get_profile.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Logout logout;

  AuthBloc({required this.login, required this.logout})
    : super(const AuthState.initial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await login(
      LoginParams(username: event.username, password: event.password),
    );

    if (result.isLeft()) {
      result.fold((failure) => emit(AuthState.error(failure.message)), (_) {});
    } else {
      await _prefetchData();
      emit(const AuthState.authenticated());
    }
  }

  Future<void> _prefetchData() async {
    try {
      await Future.wait([
        sl<GetEmployees>().call(const GetEmployeesParams(page: 1)),
        sl<GetProfile>().call(const NoParams()),
      ]);
    } catch (_) {
      // Prefetch gagal tidak apa-apa
      // Data akan diambil langsung saat halaman dibuka
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await logout(const NoParams());
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}