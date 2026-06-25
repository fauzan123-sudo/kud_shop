import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import '../bloc/admin_order_bloc.dart';

class AdminOrderDetailPage extends StatefulWidget {
  final OrderEntity order;

  const AdminOrderDetailPage({super.key, required this.order});

  @override
  State<AdminOrderDetailPage> createState() => _AdminOrderDetailPageState();
}

class _AdminOrderDetailPageState extends State<AdminOrderDetailPage> {
  late OrderEntity _order;

  @override
  void initState() {
    super.initState();
    _order = widget.order;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminOrderBloc, AdminOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          updateSuccess: (orders) {
            final updated = orders.where((o) => o.id == _order.id).firstOrNull;
            if (updated != null) {
              setState(() => _order = updated);
              AppSnackbar.success(context, 'Status pesanan berhasil diubah');
            }
          },
          updateError: (orders, message) {
            AppSnackbar.error(context, message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isUpdating = state.maybeWhen(
          updating: (_) => true,
          orElse: () => false,
        );

        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: Text('Pesanan #${_order.id}'),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildCard(child: _buildInfoSection()),
              const SizedBox(height: 12),
              _buildCard(child: _buildProductSection()),
              const SizedBox(height: 12),
              _buildCard(child: _buildAddressSection()),
              if (_order.paymentProofUrl != null) ...[
                const SizedBox(height: 12),
                _buildCard(child: _buildPaymentProofSection()),
              ],
              const SizedBox(height: 12),
              _buildCard(child: _buildTotalSection()),
              const SizedBox(height: 24),
              if (!_order.isDelivered && !_order.isCancelled)
                _buildActionButtons(context, isUpdating),
            ],
          ),
        );
      },
    );
  }

  // ─── Section Builders ──────────────────────────────────────

  Widget _buildInfoSection() {
    return Column(
      children: [
        _buildRow('Order Id', '#${_order.id}'),
        const SizedBox(height: 10),
        _buildRow(
          'Status',
          _order.statusLabel,
          valueColor: _statusColor(_order.status),
        ),
        const SizedBox(height: 10),
        _buildRow('Tanggal', _formatDate(_order.createdAt)),
        const SizedBox(height: 10),
        _buildRow('Pembayaran', _order.paymentMethodLabel),
        const SizedBox(height: 10),
        _buildRow('Pengiriman', _order.deliveryMethodLabel),
        if (_order.notes != null && _order.notes!.isNotEmpty) ...[
          const SizedBox(height: 10),
          _buildRow('Catatan', _order.notes!),
        ],
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isUpdating) {
    const statusOptions = [
      ('pending', 'Menunggu Konfirmasi'),
      ('confirmed', 'Dikonfirmasi'),
      ('processing', 'Diproses'),
      ('delivered', 'Selesai'),
      ('cancelled', 'Dibatalkan'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ubah Status Pesanan', style: AppTextStyle.label),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _order.status,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            items: statusOptions.map((option) {
              final (value, label) = option;
              final Color color = switch (value) {
                'pending' => Colors.orange,
                'confirmed' => Colors.blue,
                'processing' => Colors.purple,
                'delivered' => Colors.green,
                'cancelled' => Colors.red,
                _ => Colors.grey,
              };
              return DropdownMenuItem(
                value: value,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(label),
                  ],
                ),
              );
            }).toList(),
            onChanged: isUpdating
                ? null
                : (newStatus) {
                    if (newStatus == null || newStatus == _order.status) return;
                    if (newStatus == 'cancelled') {
                      _confirmCancel(context);
                    } else {
                      _updateStatus(context, newStatus);
                    }
                  },
          ),
          if (isUpdating) ...[
            const SizedBox(height: 12),
            const Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }

  Widget _buildProductSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Produk', style: AppTextStyle.label),
        const SizedBox(height: 10),
        ..._order.items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${item.productName} (x${item.quantity})',
                    style: AppTextStyle.bodyMedium,
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
        }),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Info Penerima', style: AppTextStyle.label),
        const SizedBox(height: 10),
        _buildRow('Nama', _order.recipientName),
        const SizedBox(height: 6),
        _buildRow('Telepon', _order.recipientPhone),
        if (_order.recipientAddress != null) ...[
          const SizedBox(height: 6),
          _buildRow('Alamat', _order.recipientAddress!),
        ],
      ],
    );
  }

  Widget _buildPaymentProofSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Bukti Transfer', style: AppTextStyle.label),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            _order.paymentProofUrl!,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) {
              if (progress == null) return child;
              return Container(
                height: 180,
                color: Colors.grey.shade200,
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (_, __, ___) => Container(
              height: 100,
              color: Colors.grey.shade200,
              child: const Center(child: Icon(Icons.broken_image_outlined)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSection() {
    return Center(
      child: Column(
        children: [
          Text(
            'Total',
            style: AppTextStyle.bodySmall.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          Text('Rp ${CurrencyFormatter.format(_order.totalPrice)}', style: AppTextStyle.h3),
        ],
      ),
    );
  }

  // ─── Actions ───────────────────────────────────────────────

  void _updateStatus(BuildContext context, String status) {
    context.read<AdminOrderBloc>().add(
      AdminOrderEvent.updateStatus(orderId: _order.id, status: status),
    );
  }

  Future<void> _confirmCancel(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Batalkan Pesanan?'),
        content: Text(
          'Pesanan #${_order.id} akan dibatalkan. Tindakan ini tidak dapat diurungkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text(
              'Ya, Batalkan',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      _updateStatus(context, 'cancelled');
    }
  }

  // ─── Helpers ───────────────────────────────────────────────

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget _buildRow(String label, String value, {Color? valueColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text('$label :', style: AppTextStyle.label),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyle.bodyMedium.copyWith(color: valueColor),
          ),
        ),
      ],
    );
  }

  Color _statusColor(String status) => switch (status) {
    'pending' => Colors.orange,
    'confirmed' => Colors.blue,
    'processing' => Colors.purple,
    'delivered' => Colors.green,
    'cancelled' => Colors.red,
    _ => Colors.grey,
  };

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
    return '${days[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} '
        '${date.year}, ${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}
