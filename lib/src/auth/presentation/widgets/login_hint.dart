import 'package:flutter/material.dart';

class LoginHint extends StatelessWidget {
  const LoginHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Demo: username emilys / password emilyspass',
              style: TextStyle(fontSize: 12, color: Colors.blue.shade700),
            ),
          ),
        ],
      ),
    );
  }
}