import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import '../bloc/admin_order_bloc.dart';
import 'admin_order_detail_page.dart';

class AdminOrderPage extends StatelessWidget {
  const AdminOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AdminOrderBloc>()..add(const AdminOrderEvent.load()),
      child: const _AdminOrderView(),
    );
  }
}

class _AdminOrderView extends StatelessWidget {
  const _AdminOrderView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Manajemen Pesanan'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<AdminOrderBloc>().add(
              const AdminOrderEvent.load(),
            ),
          ),
        ],
      ),
      body: BlocConsumer<AdminOrderBloc, AdminOrderState>(
        listener: (context, state) {
          state.maybeWhen(
            updateError: (orders, message) =>
                AppSnackbar.error(context, message),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            initial: () => true,
            orElse: () => false,
          );
          if (isLoading)
            return const Center(child: CircularProgressIndicator());

          final errorMsg = state.maybeWhen(
            error: (msg) => msg,
            orElse: () => null,
          );
          if (errorMsg != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    errorMsg,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.read<AdminOrderBloc>().add(
                      const AdminOrderEvent.load(),
                    ),
                    child: const Text('Coba lagi'),
                  ),
                ],
              ),
            );
          }

          final orders = state.maybeWhen(
            loaded: (o) => o,
            updating: (o) => o,
            updateSuccess: (o) => o,
            updateError: (o, _) => o,
            orElse: () => <OrderEntity>[],
          );

          if (orders.isEmpty) {
            return Center(
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
            );
          }

          return RefreshIndicator(
            onRefresh: () async => context.read<AdminOrderBloc>().add(
              const AdminOrderEvent.load(),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => _OrderCard(order: orders[index]),
            ),
          );
        },
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderEntity order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<AdminOrderBloc>(),
              child: AdminOrderDetailPage(order: order),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
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
                Text('#${order.id}', style: AppTextStyle.label),
                _StatusChip(order: order),
              ],
            ),
            const Divider(height: 16),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 16),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    order.recipientName,
                    style: AppTextStyle.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.inventory_2_outlined, size: 16),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    order.items.isNotEmpty
                        ? '${order.items.first.productName}'
                              '${order.items.length > 1 ? ' +${order.items.length - 1} lainnya' : ''}'
                        : '-',
                    style: AppTextStyle.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(order.createdAt),
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.grey.shade500,
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

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Ags',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}, '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}

class _StatusChip extends StatelessWidget {
  final OrderEntity order;

  const _StatusChip({required this.order});

  @override
  Widget build(BuildContext context) {
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
}
