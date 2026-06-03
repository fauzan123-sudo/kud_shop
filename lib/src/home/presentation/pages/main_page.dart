import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_playground/component/widgets/alert/exit_confirmation_dialog.dart';
import 'package:flutter_ui_playground/component/widgets/bottom_nav/bottom_nav_bar.dart';
import 'package:flutter_ui_playground/src/employee/presentation/pages/employee_page.dart';
import 'package:flutter_ui_playground/src/home/presentation/pages/dashboard_page.dart';
import 'package:flutter_ui_playground/src/profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onNavigate(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(onNavigate: _onNavigate),
      const EmployeePage(),
      const ProfilePage(),
    ];

    return PopScope(
      // ← intercept tombol back
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
        } else {
          // ← cukup satu baris
          final shouldExit = await ExitConfirmationDialog.show(context);

          if (shouldExit == true && context.mounted) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onNavigate,
        ),
      ),
    );
  }
}
