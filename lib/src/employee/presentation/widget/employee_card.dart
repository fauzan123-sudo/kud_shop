import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/core/navigation/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          'Karyawan ${employee.name}, '
          'posisi ${employee.position}, '
          'departemen ${employee.department}, '
          '${employee.isActive ? 'aktif' : 'tidak aktif'}',
      button: true,
      child: GestureDetector(
        onTap: () => context.push('${AppRoutes.employee}/${employee.id}'),
        child: Container(
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
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: ExcludeSemantics(
              // ← avatar tidak perlu dibaca
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue.shade100,
                backgroundImage: employee.avatarUrl.isNotEmpty
                    ? CachedNetworkImageProvider(employee.avatarUrl)
                    : null,
                child: employee.avatarUrl.isEmpty
                    ? Text(
                        employee.name.isNotEmpty
                            ? employee.name[0].toUpperCase()
                            : '?',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
            title: Text(
              employee.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  employee.position,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                ExcludeSemantics(
                  // ← badge departemen tidak perlu dibaca
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    constraints: const BoxConstraints(maxWidth: 150),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      employee.department,
                      style: TextStyle(
                        fontSize: 11,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            trailing: ExcludeSemantics(
              // ← dot status tidak perlu dibaca
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: employee.isActive ? Colors.green : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    employee.isActive ? 'Aktif' : 'Nonaktif',
                    style: TextStyle(
                      fontSize: 10,
                      color: employee.isActive ? Colors.green : Colors.grey,
                    ),
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
