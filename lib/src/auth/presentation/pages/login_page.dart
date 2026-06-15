import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/widgets/app_error_message.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../component/themes/app_text_style.dart';
import '../../../../component/widgets/button/app_button.dart';
import '../../../../component/widgets/textfiled/app_email_field.dart';
import '../../../../component/widgets/textfiled/app_password_field.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          final errorMessage = state is AuthError ? state.message : null;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),

                    // ─── Header ──────────────────────────────
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.storefront,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Selamat datang', style: AppTextStyle.h1),
                    const SizedBox(height: 8),
                    Text('Masuk ke akun Anda', style: AppTextStyle.hint),
                    const SizedBox(height: 48),

                    // ─── Error Message ────────────────────────
                    if (errorMessage != null) ...[
                      AppErrorMessage(message: errorMessage),
                      const SizedBox(height: 16),
                    ],

                    // ─── Email ───────────────────────────────
                    AppEmailField(controller: _emailController, label: 'Email'),
                    const SizedBox(height: 16),

                    // ─── Password ────────────────────────────
                    AppPasswordField(
                      controller: _passwordController,
                      label: 'Password',
                    ),
                    const SizedBox(height: 32),

                    // ─── Tombol Masuk ────────────────────────
                    AppButton(
                      label: 'Masuk',
                      isLoading: isLoading,
                      onPressed: _onLogin,
                    ),
                    const SizedBox(height: 24),

                    // ─── Register Link ───────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Belum punya akun? ', style: AppTextStyle.hint),
                        GestureDetector(
                          onTap: () => context.push(AppRoutes.register),
                          child: Text(
                            'Daftar',
                            style: AppTextStyle.link(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
