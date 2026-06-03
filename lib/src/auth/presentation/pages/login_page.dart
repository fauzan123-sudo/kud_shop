import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/login_button.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/login_header.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/login_hint.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/password_field.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/username_field.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/navigation/app_routes.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'emilys');
  final _passwordController = TextEditingController(text: 'emilyspass');

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is AuthAuthenticated) {
              context.go(AppRoutes.home);
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    const LoginHeader(),
                    const SizedBox(height: 48),
                    UsernameField(controller: _usernameController),
                    const SizedBox(height: 16),
                    PasswordField(controller: _passwordController),
                    const SizedBox(height: 12),
                    const LoginHint(),
                    const SizedBox(height: 32),
                    LoginButton(
                      formKey: _formKey,
                      usernameController: _usernameController,
                      passwordController: _passwordController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
