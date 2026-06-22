import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/add_to_cart.dart';
import '../widget/quantity_stepper.dart';

class CustomerProductDetailPage extends StatefulWidget {
  final ProductEntity product;

  const CustomerProductDetailPage({super.key, required this.product});

  @override
  State<CustomerProductDetailPage> createState() =>
      _CustomerProductDetailPageState();
}

class _CustomerProductDetailPageState
    extends State<CustomerProductDetailPage> {
  int _quantity = 1;
  bool _isAddingToCart = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(product),
            Padding(
              padding: const EdgeInsets.all(16),
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
                  const SizedBox(height: 8),
                  _buildStockInfo(product),
                  const SizedBox(height: 20),
                  if (product.description != null &&
                      product.description!.isNotEmpty) ...[
                    const Text('Deskripsi', style: AppTextStyle.label),
                    const SizedBox(height: 8),
                    Text(
                      product.description!,
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (!product.isOutOfStock) _buildQuantitySection(product),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context, product),
    );
  }

  Widget _buildImage(ProductEntity product) {
    if (product.imageUrl != null) {
      return Image.network(
        product.imageUrl!,
        width: double.infinity,
        height: 280,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
      );
    }
    return _buildImagePlaceholder();
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 280,
      color: Colors.grey.shade100,
      child: Icon(
        Icons.medication_outlined,
        size: 80,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildStockInfo(ProductEntity product) {
    if (product.isOutOfStock) {
      return Row(
        children: [
          Icon(Icons.error_outline, size: 16, color: Colors.red.shade600),
          const SizedBox(width: 6),
          Text(
            'Stok habis',
            style: AppTextStyle.bodySmall.copyWith(color: Colors.red.shade600),
          ),
        ],
      );
    }
    if (product.isLowStock) {
      return Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: Colors.orange.shade700),
          const SizedBox(width: 6),
          Text(
            'Stok tersisa ${product.stock}',
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.orange.shade700,
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Icon(Icons.check_circle_outline,
            size: 16, color: Colors.green.shade600),
        const SizedBox(width: 6),
        Text(
          'Stok tersedia (${product.stock})',
          style: AppTextStyle.bodySmall.copyWith(color: Colors.green.shade600),
        ),
      ],
    );
  }

  Widget _buildQuantitySection(ProductEntity product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Jumlah', style: AppTextStyle.label),
        QuantityStepper(
          quantity: _quantity,
          maxQuantity: product.stock,
          onChanged: (value) => setState(() => _quantity = value),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, ProductEntity product) {
    if (product.isOutOfStock) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: const SafeArea(
          top: false,
          child: AppButton(label: 'Stok Habis', onPressed: null),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Tambah ke Keranjang',
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).colorScheme.primary,
                isLoading: _isAddingToCart,
                onPressed: _isAddingToCart
                    ? null
                    : () => _onAddToCart(product),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppButton(
                label: 'Beli Sekarang',
                isLoading: _isAddingToCart,
                onPressed: _isAddingToCart
                    ? null
                    : () => _onBuyNow(product),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onAddToCart(ProductEntity product) async {
    setState(() => _isAddingToCart = true);
    try {
      final result = await sl<AddToCart>()(
        AddToCartParams(productId: product.id, quantity: _quantity),
      );
      if (!mounted) return;
      result.fold(
        (failure) => AppSnackbar.error(context, failure.message),
        (_) => AppSnackbar.success(context, 'Ditambahkan ke keranjang'),
      );
    } finally {
      if (mounted) setState(() => _isAddingToCart = false);
    }
  }

  Future<void> _onBuyNow(ProductEntity product) async {
    setState(() => _isAddingToCart = true);
    try {
      final result = await sl<AddToCart>()(
        AddToCartParams(productId: product.id, quantity: _quantity),
      );
      if (!mounted) return;
      result.fold(
        (failure) {
          AppSnackbar.error(context, failure.message);
          setState(() => _isAddingToCart = false);
        },
        (_) => context.go(AppRoutes.customerCart),
      );
    } catch (_) {
      if (mounted) setState(() => _isAddingToCart = false);
    }
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