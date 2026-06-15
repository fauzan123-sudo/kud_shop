import 'package:flutter/material.dart';

class AppLoading {
  AppLoading._();

  // ─── Show loading overlay ──────────────────────────────────
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha(50),
      builder: (_) => _LoadingDialog(message: message),
    );
  }

  // ─── Hide loading overlay ──────────────────────────────────
  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

class _LoadingDialog extends StatelessWidget {
  final String? message;

  const _LoadingDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              strokeWidth: 3,
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Inline loading indicator ─────────────────────────────────
// Dipakai di dalam widget tree, bukan overlay
class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLoadingIndicator({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
