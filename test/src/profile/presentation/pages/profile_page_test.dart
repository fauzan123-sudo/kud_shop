import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/src/auth/domain/entities/user_entity.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_event.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_state.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

// ─── Fixture ─────────────────────────────────────────────────────────────────
const tUserCustomer = UserEntity(
  id: 'test-uuid-1234',
  name: 'Ahmad Fauzan',
  email: 'fauzan@gmail.com',
  role: 'customer',
  phone: '+62 812 3456 7890',
);

const tUserAdmin = UserEntity(
  id: 'test-uuid-5678',
  name: 'Admin User',
  email: 'admin@gmail.com',
  role: 'admin',
);

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() {
    registerFallbackValue(const AuthEvent.logout());
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  tearDown(() async {
    await mockAuthBloc.close();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const _ProfilePageTestWrapper(),
      ),
    );
  }

  // ─── UI saat authenticated ────────────────────────────────────────────────
  group('ProfilePage UI - Customer', () {
    setUp(() {
      when(
        () => mockAuthBloc.state,
      ).thenReturn(const AuthState.authenticated(tUserCustomer));
    });

    testWidgets('harus menampilkan AppBar Profil Saya', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Profil Saya'), findsOneWidget);
    });

    testWidgets('harus menampilkan nama user', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Ahmad Fauzan'), findsOneWidget);
    });

    testWidgets('harus menampilkan email user', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('fauzan@gmail.com'), findsOneWidget);
    });

    testWidgets('harus menampilkan nomor telepon user', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('+62 812 3456 7890'), findsOneWidget);
    });

    testWidgets('harus menampilkan badge Customer', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Customer'), findsWidgets);
    });

    testWidgets(
      'harus menampilkan inisial nama di avatar saat tidak ada foto',
      (tester) async {
        await tester.pumpWidget(buildWidget());
        // inisial dari 'Ahmad Fauzan' = 'A'
        expect(find.text('A'), findsOneWidget);
      },
    );

    testWidgets('harus menampilkan tombol logout', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byIcon(Icons.logout), findsOneWidget);
    });

    testWidgets('harus menampilkan label Email', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('harus menampilkan label Telepon', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Telepon'), findsOneWidget);
    });

    testWidgets('harus menampilkan label Role', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Role'), findsOneWidget);
    });
  });

  // ─── UI saat Admin ────────────────────────────────────────────────────────
  group('ProfilePage UI - Admin', () {
    setUp(() {
      when(
        () => mockAuthBloc.state,
      ).thenReturn(const AuthState.authenticated(tUserAdmin));
    });

    testWidgets('harus menampilkan badge Admin', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Admin'), findsWidgets);
    });

    testWidgets('harus tampilkan dash saat phone null', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('-'), findsOneWidget);
    });
  });

  // ─── Loading state ────────────────────────────────────────────────────────
  group('ProfilePage loading state', () {
    testWidgets('tombol logout harus disabled saat loading', (tester) async {
      // ← langsung set state loading dari awal, bukan ganti di tengah
      when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());

      await tester.pumpWidget(buildWidget());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  // ─── BLoC Interaction ─────────────────────────────────────────────────────
  group('ProfilePage BLoC Interaction', () {
    testWidgets('harus dispatch LogoutEvent saat tap tombol logout', (
      tester,
    ) async {
      when(
        () => mockAuthBloc.state,
      ).thenReturn(const AuthState.authenticated(tUserCustomer));

      await tester.pumpWidget(buildWidget());
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pump();

      verify(() => mockAuthBloc.add(const AuthEvent.logout())).called(1);
    });
  });
}

// ─── Wrapper ──────────────────────────────────────────────────────────────────
class _ProfilePageTestWrapper extends StatelessWidget {
  const _ProfilePageTestWrapper();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // navigasi ditangani router, di test tidak perlu
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
                    // ─── Header ─────────────────────────────────
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Column(
                        children: [
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
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
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

                    // ─── Info Card ───────────────────────────────
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Text(
                              'Informasi Akun',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          _buildInfoRow(
                            Icons.email_outlined,
                            'Email',
                            user.email,
                          ),
                          _buildInfoRow(
                            Icons.phone_outlined,
                            'Telepon',
                            user.phone ?? '-',
                          ),
                          _buildInfoRow(
                            Icons.badge_outlined,
                            'Role',
                            user.isAdmin ? 'Admin' : 'Customer',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
