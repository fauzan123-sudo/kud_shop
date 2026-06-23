import 'package:flutter/material.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/get_my_orders.dart';
import 'order_detail_page.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  bool _isLoading = true;
  List<OrderEntity> _orders = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    setState(() => _isLoading = true);

    final result = await sl<GetMyOrders>()(const NoParams());

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isLoading = false);
        AppSnackbar.error(context, failure.message);
      },
      (orders) {
        setState(() {
          _orders = orders;
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_orders.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 72,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                'Belum ada pesanan',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Order terbaru di atas.
    final sorted = [..._orders]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return RefreshIndicator(
      onRefresh: _loadOrders,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sorted.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => _buildOrderCard(sorted[index]),
      ),
    );
  }

  Widget _buildOrderCard(OrderEntity order) {
    final firstItem = order.items.isNotEmpty ? order.items.first : null;
    final extraCount = order.items.length - 1;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OrderDetailPage(order: order)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('#${order.id}', style: AppTextStyle.bodySmall),
                _buildStatusChip(order),
              ],
            ),
            const Divider(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstItem != null
                            ? firstItem.productName
                            : 'Tidak ada produk',
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (extraCount > 0) ...[
                        const SizedBox(height: 2),
                        Text(
                          '+$extraCount produk lainnya',
                          style: AppTextStyle.bodySmall.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                      const SizedBox(height: 4),
                      Text(
                        _formatDate(order.createdAt),
                        style: AppTextStyle.bodySmall.copyWith(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${order.items.fold<int>(0, (sum, i) => sum + i.quantity)} barang',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  'Rp ${CurrencyFormatter.format(order.totalPrice)}',
                  style: AppTextStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(OrderEntity order) {
    final Color color = switch (order.status) {
      'pending' => Colors.orange,
      'confirmed' => Colors.blue,
      'processing' => Colors.purple,
      'delivered' => Colors.green,
      'cancelled' => Colors.red,
      _ => Colors.grey,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        order.statusLabel,
        style: AppTextStyle.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${days[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
