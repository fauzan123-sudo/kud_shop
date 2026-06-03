import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';

class EmployeeSearchBar extends StatelessWidget {
  const EmployeeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: TextField(
        onChanged: (query) =>
            context.read<EmployeeBloc>().add(SearchEmployeeEvent(query)),
        decoration: InputDecoration(
          hintText: 'Cari nama, posisi, atau departemen...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
