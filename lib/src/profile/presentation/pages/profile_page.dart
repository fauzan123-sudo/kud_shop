import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/widgets/alert/logout_confirm_dialog.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/src/auth/domain/entities/user_entity.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_event.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_state.dart';
import 'package:kud_shop/src/profile/presentation/widget/profile_shimmer.dart';
import '../widget/profile_header.dart';
import '../widget/profile_info_card.dart';
import '../widget/profile_menu_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.go(AppRoutes.login);
        }
        if (state is AuthError) {
          AppSnackbar.error(context, state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text('Profil'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading || state is AuthInitial) {
              return const ProfileShimmer();
            }
            if (state is! AuthAuthenticated) {
              return const ProfileShimmer();
            }
            return _ProfileContent(user: state.user);
          },
        ),
      ),
    );
  }
}

class _ProfileContent extends StatefulWidget {
  final UserEntity user;

  const _ProfileContent({required this.user});

  @override
  State<_ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<_ProfileContent> {
  UserEntity? _localOverride;

  UserEntity get _user => _localOverride ?? widget.user;

  @override
  Widget build(BuildContext context) {
    final user = _user;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<AuthBloc>().add(const AuthEvent.getCurrentUser());
        await Future.delayed(const Duration(milliseconds: 800));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileHeader(
              name: user.name,
              avatarUrl: user.avatarUrl,
              isAdmin: user.isAdmin,
            ),
            const SizedBox(height: 24),
            ProfileInfoCard(
              title: 'INFORMASI AKUN',
              items: [
                ProfileInfoItem(
                  icon: Icons.person_outline,
                  label: 'Nama',
                  value: user.name,
                ),
                ProfileInfoItem(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: user.email,
                ),
                ProfileInfoItem(
                  icon: Icons.phone_outlined,
                  label: 'Nomor HP',
                  value: user.phone ?? '-',
                ),
              ],
            ),
            const SizedBox(height: 16),
            ProfileMenuButton(
              icon: Icons.edit_outlined,
              label: 'Edit Profil',
              color: Colors.blue,
              onTap: () async {
                final updatedUser = await context.push<UserEntity>(
                  user.isAdmin
                      ? AppRoutes.adminProfileEdit
                      : AppRoutes.customerProfileEdit,
                );
                if (updatedUser != null && context.mounted) {
                  setState(() => _localOverride = updatedUser);
                }
              },
            ),
            const SizedBox(height: 8),
            ProfileMenuButton(
              icon: Icons.lock_outline,
              label: 'Ubah Password',
              color: Colors.purple,
              onTap: () => context.push(
                user.isAdmin
                    ? AppRoutes.adminChangePassword
                    : AppRoutes.customerChangePassword,
              ),
            ),
            const SizedBox(height: 8),
            ProfileMenuButton(
              icon: Icons.location_on_outlined,
              label: 'Alamat Saya',
              color: Colors.green,
              onTap: () => context.push(AppRoutes.customerAddressList),
            ),
            const SizedBox(height: 8),
            ProfileMenuButton(
              icon: Icons.receipt_long_outlined,
              label: 'Riwayat Pesanan',
              color: Colors.orange,
              onTap: () => context.push(AppRoutes.customerOrderHistory),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            ProfileMenuButton(
              icon: Icons.logout,
              label: 'Keluar',
              color: Colors.red,
              onTap: () async {
                final confirmed = await LogoutConfirmDialog.show(context);
                if (!context.mounted) return;
                if (confirmed == true) {
                  context.read<AuthBloc>().add(const AuthEvent.logout());
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
