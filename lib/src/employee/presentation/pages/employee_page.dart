import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_playground/component/widgets/error_widget.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_card.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_empty.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_search_bar.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_shimmer.dart';
import '../../../../core/injection/injection.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // ← trigger load more ketika scroll hampir ke bawah
      context.read<EmployeeBloc>().add(const EmployeeEvent.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EmployeeBloc>()..add(const GetEmployeesEvent()),
      child: const _EmployeeView(), // ← pisah ke widget baru
    );
  }
}

class _EmployeeView extends StatefulWidget {
  const _EmployeeView();

  @override
  State<_EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<_EmployeeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // ← sekarang context sudah punya EmployeeBloc
      context.read<EmployeeBloc>().add(const EmployeeEvent.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(title: const Text('Karyawan')),
      body: Column(
        children: [
          const EmployeeSearchBar(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeLoading) return const EmployeeShimmer();
        if (state is EmployeeError) {
          return AppErrorWidget(
            message: state.message,
            onRetry: () =>
                context.read<EmployeeBloc>().add(const GetEmployeesEvent()),
          );
        }
        if (state is EmployeeLoaded) {
          if (state.filtered.isEmpty) return const EmployeeEmpty();
          return RefreshIndicator(
            onRefresh: () async {
              context.read<EmployeeBloc>().add(
                const EmployeeEvent.getEmployees(),
              );
            },
            child: ListView.separated(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: state.filtered.length + (state.isLoadingMore ? 1 : 0),
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, index) {
                if (index == state.filtered.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return EmployeeCard(employee: state.filtered[index]);
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
