import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import '../../domain/entities/cart_item_entity.dart';

class CartItemTile extends StatelessWidget {
  final CartItemEntity item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Gambar produk ──────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: item.productImageUrl != null
                ? Image.network(
                    item.productImageUrl!,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildPlaceholder(),
                  )
                : _buildPlaceholder(),
          ),
          const SizedBox(width: 12),

          // ─── Info produk ────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: AppTextStyle.label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp ${CurrencyFormatter.format(item.productPrice)}',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (item.isOutOfStock) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Stok habis',
                    style: AppTextStyle.caption.copyWith(color: Colors.red),
                  ),
                ] else if (item.exceedsStock) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Hanya tersisa ${item.stock}',
                    style: AppTextStyle.caption.copyWith(
                      color: Colors.orange.shade700,
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 4),
                  Text(
                    'Stok tersedia: ${item.stock}',
                    style: AppTextStyle.caption.copyWith(color: Colors.grey),
                  ),
                ],
                const SizedBox(height: 8),
                _buildQuantityStepper(context),
              ],
            ),
          ),

          // ─── Hapus ───────────────────────────────────
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
            onPressed: onRemove,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityStepper(BuildContext context) {
    return Row(
      children: [
        _StepperButton(
          icon: Icons.remove,
          onTap: () => onQuantityChanged(item.quantity - 1),
        ),
        Container(
          width: 36,
          alignment: Alignment.center,
          child: Text(
            '${item.quantity}',
            style: AppTextStyle.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _StepperButton(
          icon: Icons.add,
          onTap: item.isOutOfStock || item.quantity >= item.stock
              ? null
              : () => onQuantityChanged(item.quantity + 1),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 64,
      height: 64,
      color: Colors.grey.shade100,
      child: Icon(
        Icons.medication_outlined,
        color: Colors.grey.shade400,
        size: 24,
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDisabled ? Colors.grey.shade200 : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isDisabled ? Colors.grey.shade300 : Colors.grey.shade700,
        ),
      ),
    );
  }
}
