import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_ui_playground/src/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/login_header.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/login_hint.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/login_button.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/username_field.dart';
import 'package:flutter_ui_playground/src/auth/presentation/widgets/password_field.dart';

// ← mock AuthBloc
class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    // ← state awal adalah initial
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
  });

  tearDown(() {
    mockAuthBloc.close();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: GlobalKey<FormState>(),
              child: Column(
                children: [
                  const LoginHeader(),
                  UsernameField(
                    controller: TextEditingController(text: 'emilys'),
                  ),
                  PasswordField(
                    controller: TextEditingController(text: 'emilyspass'),
                  ),
                  const LoginHint(),
                  LoginButton(
                    formKey: GlobalKey<FormState>(),
                    usernameController:
                        TextEditingController(text: 'emilys'),
                    passwordController:
                        TextEditingController(text: 'emilyspass'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  group('LoginPage', () {
    testWidgets('harus menampilkan teks Selamat datang', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Selamat datang'), findsOneWidget);
    });

    testWidgets('harus menampilkan field username', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byType(UsernameField), findsOneWidget);
    });

    testWidgets('harus menampilkan field password', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byType(PasswordField), findsOneWidget);
    });

    testWidgets('harus menampilkan hint demo', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(
        find.text('Demo: username emilys / password emilyspass'),
        findsOneWidget,
      );
    });

    testWidgets('harus menampilkan tombol Masuk', (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.text('Masuk'), findsOneWidget);
    });

    testWidgets('harus menampilkan tombol Masuk disabled saat loading',
        (tester) async {
      // ← ubah state menjadi loading
      when(() => mockAuthBloc.state).thenReturn(const AuthState.loading());
      await tester.pumpWidget(buildWidget());

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      // ← tombol harus disabled
      expect(button.onPressed, isNull);
    });

    testWidgets('harus bisa input username', (tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(
        find.byType(UsernameField),
        'emilys',
      );
      expect(find.text('emilys'), findsWidgets);
    });

    testWidgets('harus bisa input password', (tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.enterText(
        find.byType(PasswordField),
        'emilyspass',
      );
      expect(find.text('emilyspass'), findsWidgets);
    });
  });
}
