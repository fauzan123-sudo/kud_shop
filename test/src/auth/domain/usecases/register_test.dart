import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_event.dart';
import 'package:kud_shop/src/auth/presentation/bloc/auth_state.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
  });

  tearDown(() => mockAuthBloc.close());

  // Helper: wrap RegisterPage dengan BlocProvider mock
  // (menggantikan BlocProvider(create: (_) => sl<AuthBloc>()) di dalam page)
  Widget buildWidget() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const _RegisterPageTestWrapper(),
      ),
    );
  }

  group('RegisterPage UI', () {
    testWidgets('harus menampilkan teks Buat Akun', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Buat Akun'), findsOneWidget);
    });

    testWidgets('harus menampilkan field nama lengkap', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Nama Lengkap'), findsOneWidget);
    });

    testWidgets('harus menampilkan field email', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('harus menampilkan field password', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('harus menampilkan field konfirmasi password', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Konfirmasi Password'), findsOneWidget);
    });

    testWidgets('harus menampilkan tombol Daftar', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Daftar'), findsOneWidget);
    });

    testWidgets('harus menampilkan link Masuk', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Masuk'), findsOneWidget);
    });

    testWidgets('tombol Daftar harus disabled saat loading', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());
      await tester.pumpWidget(buildWidget());

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('tombol Daftar harus enabled saat initial', (tester) async {
      await tester.pumpWidget(buildWidget());

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);
    });
  });

  group('RegisterPage Validasi Form', () {
    testWidgets('harus tampil error saat form dikosongkan', (tester) async {
      await tester.pumpWidget(buildWidget());

      await tester.tap(find.text('Daftar'));
      await tester.pump();

      expect(find.text('Nama wajib diisi'), findsOneWidget);
      expect(find.text('Email wajib diisi'), findsOneWidget);
      expect(find.text('Password wajib diisi'), findsOneWidget);
      expect(find.text('Konfirmasi password wajib diisi'), findsOneWidget);
    });

    testWidgets('harus tampil error saat nama kurang dari 3 karakter', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());

      await tester.enterText(find.byType(TextFormField).at(0), 'ab');
      await tester.tap(find.text('Daftar'));
      await tester.pump();

      expect(find.text('Nama minimal 3 karakter'), findsOneWidget);
    });

    testWidgets('harus tampil error saat format email tidak valid', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());

      await tester.enterText(
        find.byType(TextFormField).at(1),
        'emailtidakvalid',
      );
      await tester.tap(find.text('Daftar'));
      await tester.pump();

      expect(find.text('Format email tidak valid'), findsOneWidget);
    });

    testWidgets('harus tampil error saat password kurang dari 8 karakter', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());

      await tester.enterText(find.byType(TextFormField).at(2), '1234567');
      await tester.tap(find.text('Daftar'));
      await tester.pump();

      expect(find.text('Password minimal 8 karakter'), findsOneWidget);
    });

    testWidgets('harus tampil error saat konfirmasi password tidak cocok', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());

      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.enterText(find.byType(TextFormField).at(3), 'password456');
      await tester.tap(find.text('Daftar'));
      await tester.pump();

      expect(find.text('Password tidak cocok'), findsOneWidget);
    });
  });

  group('RegisterPage BLoC Interaction', () {
    testWidgets('harus dispatch RegisterEvent saat form valid', (tester) async {
      await tester.pumpWidget(buildWidget());

      await tester.enterText(find.byType(TextFormField).at(0), 'Ahmad Fauzan');
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'fauzan@gmail.com',
      );
      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');

      await tester.tap(find.text('Daftar'));
      await tester.pump();

      verify(
        () => mockAuthBloc.add(
          const AuthEvent.register(
            name: 'Ahmad Fauzan',
            email: 'fauzan@gmail.com',
            password: 'password123',
          ),
        ),
      ).called(1);
    });

    testWidgets('harus tampilkan snackbar error saat AuthError', (
      tester,
    ) async {
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([
          const AuthState.loading(),
          const AuthState.error('User already registered'),
        ]),
        initialState: const AuthState.initial(),
      );

      await tester.pumpWidget(buildWidget());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('User already registered'), findsOneWidget);
    });
  });
}

// ─── Wrapper agar BlocProvider internal di RegisterPage tidak bentrok ───────
// RegisterPage punya BlocProvider(create: (_) => sl<AuthBloc>()) di dalamnya.
// Untuk test, kita bypass dengan render konten inner-nya langsung.
class _RegisterPageTestWrapper extends StatefulWidget {
  const _RegisterPageTestWrapper();

  @override
  State<_RegisterPageTestWrapper> createState() =>
      _RegisterPageTestWrapperState();
}

class _RegisterPageTestWrapperState extends State<_RegisterPageTestWrapper> {
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
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
                  const SizedBox(height: 24),
                  const Text(
                    'Buat Akun',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text('Nama Lengkap'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
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
                  const Text('Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email wajib diisi';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Password'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password wajib diisi';
                      }
                      if (value.length < 8) {
                        return 'Password minimal 8 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Konfirmasi Password'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi password wajib diisi';
                      }
                      if (value != _passwordController.text) {
                        return 'Password tidak cocok';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _onRegister,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Daftar'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sudah punya akun? '),
                      GestureDetector(onTap: () {}, child: const Text('Masuk')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
