class CurrencyFormatter {
  CurrencyFormatter._();

  /// Format angka jadi format rupiah dengan titik pemisah ribuan.
  /// Contoh: 120000 → '120.000'
  static String format(double price) {
    return price
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
  }
}