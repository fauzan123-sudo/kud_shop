import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';

class AppErrorMessage extends StatelessWidget {
  final String message;

  const AppErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: AppTextStyle.bodySmall.copyWith(
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
