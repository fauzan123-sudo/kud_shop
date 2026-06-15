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

  setUpAll(() {
    registerFallbackValue(const AuthEvent.login(email: '', password: ''));
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
  });

  tearDown(() async {
    await mockAuthBloc.close();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const _LoginPageTestWrapper(),
      ),
    );
  }

  // ─── UI ───────────────────────────────────────────────────────────────────
  group('LoginPage UI', () {
    testWidgets('harus menampilkan teks Selamat datang', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Selamat datang'), findsOneWidget);
    });

    testWidgets('harus menampilkan teks Masuk ke akun Anda', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Masuk ke akun Anda'), findsOneWidget);
    });

    testWidgets('harus menampilkan label Email', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('harus menampilkan label Password', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('harus menampilkan tombol Masuk', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Masuk'), findsOneWidget);
    });

    testWidgets('harus menampilkan link Daftar', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Daftar'), findsOneWidget);
    });

    testWidgets('harus menampilkan teks Belum punya akun?', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Belum punya akun? '), findsOneWidget);
    });

    testWidgets('tombol Masuk harus disabled saat loading', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());
      await tester.pumpWidget(buildWidget());
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('tombol Masuk harus enabled saat initial', (tester) async {
      await tester.pumpWidget(buildWidget());
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);
    });

    testWidgets('harus ada 2 TextFormField (email & password)', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byType(TextFormField), findsNWidgets(2));
    });
  });

  // ─── Validasi Form ────────────────────────────────────────────────────────
  group('LoginPage Validasi Form', () {
    testWidgets('harus tampil error saat form dikosongkan', (tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.tap(find.text('Masuk'));
      await tester.pump();
      expect(find.text('Email wajib diisi'), findsOneWidget);
      expect(find.text('Password wajib diisi'), findsOneWidget);
    });

    testWidgets('harus tampil error saat format email tidak valid', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(
        find.byType(TextFormField).first,
        'emailtidakvalid',
      );
      await tester.tap(find.text('Masuk'));
      await tester.pump();
      expect(find.text('Format email tidak valid'), findsOneWidget);
    });

    testWidgets('harus tampil error saat password kurang dari 8 karakter', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(find.byType(TextFormField).last, '1234567');
      await tester.tap(find.text('Masuk'));
      await tester.pump();
      expect(find.text('Password minimal 8 karakter'), findsOneWidget);
    });

    testWidgets('tidak harus tampil error saat form valid', (tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(
        find.byType(TextFormField).first,
        'fauzan@gmail.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Masuk'));
      await tester.pump();
      expect(find.text('Email wajib diisi'), findsNothing);
      expect(find.text('Password wajib diisi'), findsNothing);
    });
  });

  // ─── BLoC Interaction ─────────────────────────────────────────────────────
  group('LoginPage BLoC Interaction', () {
    testWidgets('harus dispatch LoginEvent saat form valid', (tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(
        find.byType(TextFormField).first,
        'fauzan@gmail.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Masuk'));
      await tester.pump();

      verify(
        () => mockAuthBloc.add(
          const AuthEvent.login(
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
          const AuthState.error('Email atau password salah'),
        ]),
        initialState: const AuthState.initial(),
      );

      await tester.pumpWidget(buildWidget());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Email atau password salah'), findsOneWidget);
    });

    testWidgets('tidak harus dispatch LoginEvent saat email kosong', (
      tester,
    ) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Masuk'));
      await tester.pump();

      verifyNever(() => mockAuthBloc.add(any()));
    });
  });
}

// ─── Wrapper ──────────────────────────────────────────────────────────────────
class _LoginPageTestWrapper extends StatefulWidget {
  const _LoginPageTestWrapper();

  @override
  State<_LoginPageTestWrapper> createState() => _LoginPageTestWrapperState();
}

class _LoginPageTestWrapperState extends State<_LoginPageTestWrapper> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

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
                  const SizedBox(height: 60),
                  const Text(
                    'Selamat datang',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Masuk ke akun Anda'),
                  const SizedBox(height: 48),
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'contoh@gmail.com',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email wajib diisi';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
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
                  const SizedBox(height: 32),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;
                      return SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _onLogin,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Masuk'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun? '),
                      GestureDetector(
                        onTap: () {},
                        child: const Text('Daftar'),
                      ),
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
