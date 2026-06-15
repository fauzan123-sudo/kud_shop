import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? matchController; // untuk konfirmasi password

  const AppPasswordField({
    super.key,
    required this.controller,
    this.label,
    this.hint = '••••••••',
    this.validator,
    this.matchController,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: widget.controller,
          obscureText: _obscure,
          decoration: _decoration(context),
          validator: widget.validator ?? _defaultValidator,
        ),
      ],
    );
  }

  InputDecoration _decoration(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return InputDecoration(
      hintText: widget.hint,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
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
    if (value == null || value.isEmpty) return 'Password wajib diisi';
    if (value.length < 8) return 'Password minimal 8 karakter';

    // ← validasi konfirmasi password kalau matchController diisi
    if (widget.matchController != null &&
        value != widget.matchController!.text) {
      return 'Password tidak cocok';
    }
    return null;
  }
}