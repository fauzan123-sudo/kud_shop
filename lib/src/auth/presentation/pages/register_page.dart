import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../component/themes/app_text_style.dart';
import '../../../../component/widgets/button/app_button.dart';
import '../../../../component/widgets/textfiled/app_email_field.dart';
import '../../../../component/widgets/textfiled/app_password_field.dart';
import '../../../../component/widgets/textfiled/app_text_field.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.register(
          name: _nameController.text.trim(),
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            current is AuthError || current is AuthRegisterSuccess,
        buildWhen: (previous, current) => true,
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: AppTextStyle.bodyMedium.copyWith(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 4),
              ),
            );
          }
          if (state is AuthRegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Registrasi berhasil! Silakan login.',
                  style: AppTextStyle.bodyMedium.copyWith(color: Colors.white),
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 4),
              ),
            );
            context.pop();
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),

                    // ─── Back Button ──────────────────────────
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.arrow_back_ios_new, size: 16),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ─── Header ───────────────────────────────
                    const Text('Buat Akun', style: AppTextStyle.h1),
                    const SizedBox(height: 8),
                    Text('Daftar untuk mulai berbelanja', style: AppTextStyle.hint),
                    const SizedBox(height: 32),

                    // ─── Nama ─────────────────────────────────
                    AppTextField(
                      controller: _nameController,
                      label: 'Nama Lengkap',
                      hint: 'Masukkan nama lengkap',
                      prefixIcon: Icons.person_outline,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama wajib diisi';
                        }
                        if (value.trim().length < 3) {
                          return 'Nama minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // ─── Email ────────────────────────────────
                    AppEmailField(
                      controller: _emailController,
                      label: 'Email',
                    ),
                    const SizedBox(height: 16),

                    // ─── Password ─────────────────────────────
                    AppPasswordField(
                      controller: _passwordController,
                      label: 'Password',
                      hint: 'Minimal 8 karakter',
                    ),
                    const SizedBox(height: 16),

                    // ─── Konfirmasi Password ──────────────────
                    AppPasswordField(
                      controller: _confirmPasswordController,
                      label: 'Konfirmasi Password',
                      hint: 'Ulangi password',
                      matchController: _passwordController,
                    ),
                    const SizedBox(height: 32),

                    // ─── Tombol Daftar ────────────────────────
                    AppButton(
                      label: 'Daftar',
                      isLoading: isLoading,
                      onPressed: _onRegister,
                    ),
                    const SizedBox(height: 24),

                    // ─── Login Link ───────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah punya akun? ', style: AppTextStyle.hint),
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Text('Masuk', style: AppTextStyle.link(context)),
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