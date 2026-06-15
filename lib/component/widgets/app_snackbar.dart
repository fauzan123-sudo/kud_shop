import 'package:flutter/material.dart';

class AppSnackbar {
  AppSnackbar._();

  // ─── Sukses ───────────────────────────────────────────────
  static void success(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.green.shade600,
      icon: Icons.check_circle_outline,
    );
  }

  // ─── Error ────────────────────────────────────────────────
  static void error(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.red.shade600,
      icon: Icons.error_outline,
    );
  }

  // ─── Warning ──────────────────────────────────────────────
  static void warning(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.orange.shade600,
      icon: Icons.warning_amber_outlined,
    );
  }

  // ─── Info ─────────────────────────────────────────────────
  static void info(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.blue.shade600,
      icon: Icons.info_outline,
    );
  }

  // ─── Internal ─────────────────────────────────────────────
  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
  }
}
