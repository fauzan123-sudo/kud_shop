import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kud_shop/component/widgets/textfiled/app_text_field.dart';
import 'package:kud_shop/core/utils/currency_input_formatter.dart';

class ProductNameField extends StatelessWidget {
  final TextEditingController controller;

  const ProductNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'Nama Obat',
      hint: 'Masukkan nama obat',
      prefixIcon: Icons.medication_outlined,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Nama obat wajib diisi';
        return null;
      },
    );
  }
}

class ProductDescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const ProductDescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'Deskripsi',
      hint: 'Masukkan deskripsi obat (opsional)',
      prefixIcon: Icons.description_outlined,
      maxLines: 3,
    );
  }
}

class ProductPriceField extends StatelessWidget {
  final TextEditingController controller;

  const ProductPriceField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'Harga (Rp)',
      hint: '0',
      prefixIcon: Icons.attach_money,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) return 'Harga wajib diisi';
        return null;
      },
    );
  }
}

class ProductStockField extends StatelessWidget {
  final TextEditingController controller;

  const ProductStockField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'Stok',
      hint: '0',
      prefixIcon: Icons.inventory_2_outlined,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || value.isEmpty) return 'Stok wajib diisi';
        return null;
      },
    );
  }
}
