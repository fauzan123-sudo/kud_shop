import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';

class CheckoutSummaryItem extends StatelessWidget {
  final CartItemEntity item;
  final ValueChanged<int>? onQuantityChanged;

  const CheckoutSummaryItem({
    super.key,
    required this.item,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: item.productImageUrl != null
                ? Image.network(
                    item.productImageUrl!,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildPlaceholder(),
                  )
                : _buildPlaceholder(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: AppTextStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'Rp ${CurrencyFormatter.format(item.productPrice)}',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                if (onQuantityChanged != null) ...[
                  const SizedBox(height: 6),
                  _buildStepper(),
                ],
              ],
            ),
          ),
          Text(
            'Rp ${CurrencyFormatter.format(item.subtotal)}',
            style: AppTextStyle.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      children: [
        _StepperButton(
          icon: Icons.remove,
          onTap: item.quantity <= 1
              ? null
              : () => onQuantityChanged!(item.quantity - 1),
        ),
        Container(
          width: 32,
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
          onTap: item.quantity >= item.stock
              ? null
              : () => onQuantityChanged!(item.quantity + 1),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 48,
      height: 48,
      color: Colors.grey.shade100,
      child: Icon(
        Icons.medication_outlined,
        size: 20,
        color: Colors.grey.shade400,
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
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDisabled ? Colors.grey.shade200 : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 14,
          color: isDisabled ? Colors.grey.shade300 : Colors.grey.shade700,
        ),
      ),
    );
  }
}
