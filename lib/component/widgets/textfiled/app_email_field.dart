import 'package:flutter/material.dart';

class AppEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;

  const AppEmailField({
    super.key,
    required this.controller,
    this.label,
    this.hint = 'contoh@gmail.com',
    this.validator,
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
          keyboardType: TextInputType.emailAddress,
          decoration: _decoration(context),
          validator: validator ?? _defaultValidator,
        ),
      ],
    );
  }

  InputDecoration _decoration(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return InputDecoration(
      hintText: hint,
      prefixIcon: const Icon(Icons.email_outlined),
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

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email wajib diisi';
    if (!value.contains('@') || !value.contains('.')) {
      return 'Format email tidak valid';
    }
    return null;
  }
}