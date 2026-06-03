import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/widgets/error_widget.dart';
import 'package:kud_shop/src/profile/presentation/widget/logout_button.dart';
import 'package:kud_shop/src/profile/presentation/widget/profile_header.dart';
import 'package:kud_shop/src/profile/presentation/widget/profile_info_card.dart';
import 'package:kud_shop/src/profile/presentation/widget/profile_shimmer.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProfileBloc>()..add(const GetProfileEvent())),
        BlocProvider(create: (_) => sl<AuthBloc>()),
      ],
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
            actions: const [LogoutButton()],
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const ProfileShimmer(); // ← shimmer
              }
              if (state is ProfileError) {
                return AppErrorWidget(
                  message: state.message,
                  onRetry: () =>
                      context.read<ProfileBloc>().add(const GetProfileEvent()),
                );
              }
              if (state is ProfileLoaded) {
                final p = state.profile;
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProfileBloc>().add(const GetProfileEvent());
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        ProfileHeader(
                          name: p.name,
                          position: p.position,
                          avatarUrl: p.avatarUrl,
                        ),
                        const SizedBox(height: 16),
                        ProfileInfoCard(
                          title: 'Informasi Pribadi',
                          items: [
                            ProfileInfoItem(
                              Icons.email_outlined,
                              'Email',
                              p.email,
                            ),
                            ProfileInfoItem(
                              Icons.phone_outlined,
                              'Telepon',
                              p.phone,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ProfileInfoCard(
                          title: 'Informasi Pekerjaan',
                          items: [
                            ProfileInfoItem(
                              Icons.work_outline,
                              'Posisi',
                              p.position,
                            ),
                            ProfileInfoItem(
                              Icons.business_outlined,
                              'Departemen',
                              p.department,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
