import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_playground/core/injection/injection.dart';
import 'package:flutter_ui_playground/src/employee/domain/entities/employee.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_bloc.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_event.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_state.dart';
import 'package:flutter_ui_playground/src/home/presentation/widget/dashboard_shimmer.dart';
import 'package:flutter_ui_playground/src/home/presentation/widget/quick_menu.dart';
import 'package:flutter_ui_playground/src/home/presentation/widget/summary_grid.dart';
import 'package:flutter_ui_playground/src/home/presentation/widget/welcome_banner.dart';

class DashboardPage extends StatelessWidget {
  final void Function(int index) onNavigate;

  const DashboardPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<EmployeeBloc>()..add(const EmployeeEvent.getEmployees()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text('Beranda'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            // loading → tampilkan shimmer
            if (state is EmployeeLoading) {
              return const DashboardShimmer();
            }

            final employees = state is EmployeeLoaded
                ? state.employees
                : <Employee>[];
            final total = employees.length;
            final aktif = employees.where((e) => e.isActive).length;
            final departments = employees
                .map((e) => e.department)
                .toSet()
                .length;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<EmployeeBloc>().add(
                  const EmployeeEvent.getEmployees(),
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WelcomeBanner(),
                    const SizedBox(height: 24),
                    const Text(
                      'Ringkasan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SummaryGrid(
                      total: total,
                      aktif: aktif,
                      departments: departments,
                    ),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Menu Cepat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    QuickMenu(onNavigate: onNavigate),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
