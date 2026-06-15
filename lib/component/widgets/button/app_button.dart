import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double? width;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.height = 52,
    this.width = double.infinity,
    this.icon,
  });

  // ← constructor khusus untuk tombol destructive (hapus, dll)
  const AppButton.danger({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.height = 52,
    this.width = double.infinity,
    this.icon,
  })  : backgroundColor = Colors.red,
        foregroundColor = Colors.white;

  // ← constructor khusus untuk tombol outlined
  const AppButton.outlined({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.height = 52,
    this.width = double.infinity,
    this.icon,
  })  : backgroundColor = Colors.white,
        foregroundColor = null;

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? Theme.of(context).colorScheme.primary;
    final fgColor = foregroundColor ?? Colors.white;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: fgColor,
          disabledBackgroundColor: color.withAlpha(150),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: backgroundColor == Colors.white
                ? BorderSide(color: Theme.of(context).colorScheme.primary)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: fgColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}