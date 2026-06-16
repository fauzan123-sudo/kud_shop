import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Hapus semua karakter selain angka
    final digits = newValue.text.replaceAll('.', '');

    if (digits.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Format dengan titik setiap 3 digit
    final formatted = _formatWithDots(digits);

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatWithDots(String digits) {
    final buffer = StringBuffer();
    final length = digits.length;

    for (int i = 0; i < length; i++) {
      // Hitung posisi dari belakang
      final posFromEnd = length - i - 1;
      buffer.write(digits[i]);

      // Tambah titik setiap 3 digit kecuali di akhir
      if (posFromEnd % 3 == 0 && posFromEnd != 0) {
        buffer.write('.');
      }
    }

    return buffer.toString();
  }
}
