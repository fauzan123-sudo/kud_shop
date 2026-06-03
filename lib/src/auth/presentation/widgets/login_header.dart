import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.business, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 24),
        const Text(
          'Selamat datang',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Masuk ke akun Anda untuk melanjutkan',
          style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}