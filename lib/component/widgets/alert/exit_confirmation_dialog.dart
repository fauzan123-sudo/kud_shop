import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => const ExitConfirmationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Keluar Aplikasi'),
      content: const Text('Apakah kamu yakin ingin keluar?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Tidak'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Ya'),
        ),
      ],
    );
  }
}
