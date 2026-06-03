import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_playground/component/widgets/error_widget.dart';
import 'package:flutter_ui_playground/core/injection/injection.dart';
import 'package:flutter_ui_playground/src/employee/domain/entities/employee.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_detail_bloc.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_detail_event.dart';
import 'package:flutter_ui_playground/src/employee/presentation/bloc/employee_detail_state.dart';
import 'package:flutter_ui_playground/src/employee/presentation/widget/employee_detail_shimmer.dart';
class EmployeeDetailPage extends StatelessWidget {
  final int employeeId;

  const EmployeeDetailPage({super.key, required this.employeeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<EmployeeDetailBloc>()..add(GetEmployeeDetailEvent(employeeId)),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text('Detail Karyawan'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
        body: BlocBuilder<EmployeeDetailBloc, EmployeeDetailState>(
          builder: (context, state) {
            if (state is EmployeeDetailLoading) {
              return const EmployeeDetailShimmer();
            }
            if (state is EmployeeDetailError) {
              return AppErrorWidget(
                message: state.message,
                onRetry: () => context.read<EmployeeDetailBloc>().add(
                  GetEmployeeDetailEvent(employeeId),
                ),
              );
            }
            if (state is EmployeeDetailLoaded) {
              return _buildDetail(state.employee);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildDetail(Employee e) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(e),
          const SizedBox(height: 16),
          _buildInfoCard('Informasi Pribadi', [
            _InfoItem(Icons.email_outlined, 'Email', e.email),
            _InfoItem(Icons.phone_outlined, 'Telepon', e.phone),
          ]),
          const SizedBox(height: 12),
          _buildInfoCard('Informasi Pekerjaan', [
            _InfoItem(Icons.work_outline, 'Posisi', e.position),
            _InfoItem(Icons.business_outlined, 'Departemen', e.department),
          ]),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader(Employee e) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.blue.shade100,
            backgroundImage: e.avatarUrl.isNotEmpty
                ? NetworkImage(e.avatarUrl)
                : null,
            child: e.avatarUrl.isEmpty
                ? Text(
                    e.name.isNotEmpty ? e.name[0].toUpperCase() : '?',
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
            e.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            e.position,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: e.isActive ? Colors.green.shade50 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: e.isActive ? Colors.green : Colors.grey,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  e.isActive ? 'Aktif' : 'Nonaktif',
                  style: TextStyle(
                    fontSize: 12,
                    color: e.isActive ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<_InfoItem> items) {
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
                  Column(
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
                        item.value.isNotEmpty ? item.value : '-',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ],
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
  _InfoItem(this.icon, this.label, this.value);
}
