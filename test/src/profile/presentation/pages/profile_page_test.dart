import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_ui_playground/src/profile/domain/entities/profile.dart';
import 'package:flutter_ui_playground/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_ui_playground/src/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_ui_playground/src/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_ui_playground/src/profile/presentation/widget/profile_header.dart';
import 'package:flutter_ui_playground/src/profile/presentation/widget/profile_info_card.dart';
import 'package:flutter_ui_playground/src/profile/presentation/widget/profile_shimmer.dart';

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState>
    implements ProfileBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockProfileBloc mockProfileBloc;
  late MockAuthBloc mockAuthBloc;

  const tProfile = Profile(
    id: 1,
    name: 'Emily Johnson',
    email: 'emily@test.com',
    phone: '+62 123 456 789',
    position: 'Software Engineer',
    department: 'Engineering',
    avatarUrl: 'https://dummyjson.com/icon/emilys/128',
  );

  setUp(() {
    mockProfileBloc = MockProfileBloc();
    mockAuthBloc = MockAuthBloc();
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
  });

  tearDown(() {
    mockProfileBloc.close();
    mockAuthBloc.close();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>.value(value: mockProfileBloc),
          BlocProvider<AuthBloc>.value(value: mockAuthBloc),
        ],
        child: Scaffold(
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const ProfileShimmer();
              }
              if (state is ProfileLoaded) {
                final p = state.profile;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeader(
                        name: p.name,
                        position: p.position,
                        avatarUrl: p.avatarUrl,
                      ),
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
                    ],
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

  group('ProfilePage', () {
    testWidgets('harus menampilkan shimmer saat loading', (tester) async {
      when(() => mockProfileBloc.state).thenReturn(const ProfileLoading());

      await tester.pumpWidget(buildWidget());
      expect(find.byType(ProfileShimmer), findsOneWidget);
    });

    testWidgets('harus menampilkan nama profile saat loaded', (tester) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.text('Emily Johnson'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan posisi profile saat loaded', (tester) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.text('Software Engineer'), findsWidgets);
      });
    });

    testWidgets('harus menampilkan email profile saat loaded', (tester) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.text('emily@test.com'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan telepon profile saat loaded', (
      tester,
    ) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.text('+62 123 456 789'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan departemen profile saat loaded', (
      tester,
    ) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.text('Engineering'), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan ProfileHeader saat loaded', (tester) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.byType(ProfileHeader), findsOneWidget);
      });
    });

    testWidgets('harus menampilkan 2 ProfileInfoCard saat loaded', (
      tester,
    ) async {
      when(
        () => mockProfileBloc.state,
      ).thenReturn(const ProfileState.loaded(tProfile));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(buildWidget());
        expect(find.byType(ProfileInfoCard), findsNWidgets(2));
      });
    });
  });
}
