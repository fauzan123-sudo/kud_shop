import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          onTap: onTap,
          decoration: _decoration(context),
          validator: validator,
        ),
      ],
    );
  }

  InputDecoration _decoration(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}