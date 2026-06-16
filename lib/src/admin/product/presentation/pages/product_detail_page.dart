import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _categoryName = 'Memuat...';

  @override
  void initState() {
    super.initState();
    _loadCategoryName();
  }

  Future<void> _loadCategoryName() async {
    final result = await sl<GetCategories>()(const NoParams());
    result.fold(
      (_) => setState(() => _categoryName = '-'),
      (categories) {
        final category = categories.firstWhere(
          (c) => c.id == widget.product.categoryId,
          orElse: () => CategoryEntity(
            id: 0,
            name: '-',
            createdAt: DateTime.now(),
          ),
        );
        setState(() => _categoryName = category.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Detail Obat'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push(
              AppRoutes.adminProductEdit,
              extra: product,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(product),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: AppTextStyle.h2),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${_formatPrice(product.price)}',
                    style: AppTextStyle.h3.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(context, product),
                  const SizedBox(height: 16),
                  if (product.description != null &&
                      product.description!.isNotEmpty) ...[
                    _buildDescriptionCard(product),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ProductEntity product) {
    if (product.imageUrl != null) {
      return Image.network(
        product.imageUrl!,
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
      );
    }
    return _buildImagePlaceholder();
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.grey.shade100,
      child: Icon(
        Icons.medication_outlined,
        size: 80,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, ProductEntity product) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.inventory_2_outlined,
            label: 'Stok',
            value: '${product.stock} pcs',
            valueColor: _stockColor(product),
          ),
          const Divider(height: 24),
          _buildInfoRow(
            icon: Icons.category_outlined,
            label: 'Kategori',
            value: _categoryName, // ← sekarang pakai nama kategori
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionCard(ProductEntity product) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Deskripsi', style: AppTextStyle.label),
          const SizedBox(height: 8),
          Text(
            product.description!,
            style: AppTextStyle.bodyMedium.copyWith(
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade500),
        const SizedBox(width: 12),
        Text(label, style: AppTextStyle.bodyMedium),
        const Spacer(),
        Text(
          value,
          style: AppTextStyle.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  Color _stockColor(ProductEntity product) {
    if (product.isOutOfStock) return Colors.red;
    if (product.isLowStock) return Colors.orange;
    return Colors.green;
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