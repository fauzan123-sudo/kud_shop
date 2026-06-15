import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_event.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onEdit;

  const ProductCard({super.key, required this.product, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          // ─── Gambar Produk ──────────────────────────
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: product.imageUrl != null
                ? Image.network(
                    product.imageUrl!,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
                  )
                : _buildImagePlaceholder(),
          ),

          // ─── Info Produk ────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama produk
                  Text(
                    product.name,
                    style: AppTextStyle.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Harga
                  Text(
                    'Rp ${_formatPrice(product.price)}',
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Stok + status
                  Row(
                    children: [
                      _buildStockBadge(),
                      const SizedBox(width: 8),
                      Text(
                        '${product.stock} ${product.unit}',
                        style: AppTextStyle.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ─── Aksi ───────────────────────────────────
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => _showDeleteConfirm(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: 90,
      height: 90,
      color: Colors.grey.shade100,
      child: Icon(
        Icons.medication_outlined,
        color: Colors.grey.shade400,
        size: 32,
      ),
    );
  }

  Widget _buildStockBadge() {
    Color color;
    String label;

    if (product.isOutOfStock) {
      color = Colors.red;
      label = 'Habis';
    } else if (product.isLowStock) {
      color = Colors.orange;
      label = 'Menipis';
    } else {
      color = Colors.green;
      label = 'Tersedia';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: AppTextStyle.labelSmall.copyWith(color: color)),
    );
  }

  void _showDeleteConfirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus Produk'),
        content: Text('Yakin ingin menghapus "${product.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProductBloc>().add(
                ProductEvent.delete(id: product.id),
              );
              Navigator.pop(dialogContext);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double price) {
    return price
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
  }
}
