import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            context.go(AppRoutes.login);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            title: const Text('Profil Saya'),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final isLoading = state is AuthLoading;
                  return IconButton(
                    icon: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.logout),
                    onPressed: isLoading
                        ? null
                        : () => context.read<AuthBloc>().add(
                            const AuthEvent.logout(),
                          ),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticated) {
                final user = state.user;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // ─── Header ───────────────────────────────────
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Column(
                          children: [
                            // Avatar
                            CircleAvatar(
                              radius: 48,
                              backgroundColor: Colors.blue.shade100,
                              backgroundImage: user.avatarUrl != null
                                  ? NetworkImage(user.avatarUrl!)
                                  : null,
                              child: user.avatarUrl == null
                                  ? Text(
                                      user.name.isNotEmpty
                                          ? user.name[0].toUpperCase()
                                          : '?',
                                      style: TextStyle(
                                        fontSize: 36,
                                        color: Colors.blue.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            // Nama
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Role badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: user.isAdmin
                                    ? Colors.orange.shade100
                                    : Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                user.isAdmin ? 'Admin' : 'Customer',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: user.isAdmin
                                      ? Colors.orange.shade700
                                      : Colors.blue.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ─── Info Card ────────────────────────────────
                      _buildInfoCard(
                        title: 'Informasi Akun',
                        items: [
                          _InfoItem(
                            icon: Icons.email_outlined,
                            label: 'Email',
                            value: user.email,
                          ),
                          _InfoItem(
                            icon: Icons.phone_outlined,
                            label: 'Telepon',
                            value: user.phone ?? '-',
                          ),
                          _InfoItem(
                            icon: Icons.badge_outlined,
                            label: 'Role',
                            value: user.isAdmin ? 'Admin' : 'Customer',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              }

              // fallback — seharusnya tidak tercapai karena router redirect
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<_InfoItem> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(item.icon, size: 20, color: Colors.blue.shade600),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.value,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
