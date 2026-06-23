import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

class DashboardStockTable extends StatelessWidget {
  const DashboardStockTable({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return emptyCard('Belum ada produk');
    }

    final sorted = [...products]
      ..sort((a, b) {
        int priority(ProductEntity p) {
          if (p.isOutOfStock) return 0;
          if (p.isLowStock) return 1;
          return 2;
        }

        return priority(a).compareTo(priority(b));
      });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Produk',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Stok',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...sorted.asMap().entries.map((entry) {
            final p = entry.value;
            final isLast = entry.key == sorted.length - 1;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          p.name,
                          style: AppTextStyle.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '${p.stock} ${p.unit}',
                            style: AppTextStyle.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                              color: p.isOutOfStock
                                  ? Colors.red
                                  : p.isLowStock
                                  ? Colors.orange
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: buildStockBadge(p))),
                    ],
                  ),
                ),
                if (!isLast) const Divider(height: 1),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget emptyCard(String message) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          message,
          style: AppTextStyle.bodySmall.copyWith(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget buildStockBadge(ProductEntity p) {
    final Color color;
    final String label;

    if (p.isOutOfStock) {
      color = Colors.red;
      label = 'Habis';
    } else if (p.isLowStock) {
      color = Colors.orange;
      label = 'Menipis';
    } else {
      color = Colors.green;
      label = 'Aman';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
