import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/upload_payment_proof.dart';

class PaymentProofPage extends StatefulWidget {
  final OrderEntity order;

  const PaymentProofPage({super.key, required this.order});

  @override
  State<PaymentProofPage> createState() => _PaymentProofPageState();
}

class _PaymentProofPageState extends State<PaymentProofPage> {
  static const String _bankAccountNumber = '09928-2881-98-0021';

  Uint8List? _imageBytes;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  void _onCopyAccountNumber() {
    Clipboard.setData(const ClipboardData(text: _bankAccountNumber));
    AppSnackbar.success(context, 'Nomor rekening disalin');
  }

  Future<void> _onSubmit() async {
    if (_imageBytes == null) return;

    setState(() => _isUploading = true);

    final result = await sl<UploadPaymentProof>()(
      UploadPaymentProofParams(
        orderId: widget.order.id,
        imageBytes: _imageBytes!,
      ),
    );

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isUploading = false);
        AppSnackbar.error(context, failure.message);
      },
      (_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        if (mounted) {
          context.go(AppRoutes.customerHome);
          AppSnackbar.success(context, 'Bukti transfer berhasil dikirim');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Konfirmasi Pembayaran'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountSection(),
            const SizedBox(height: 8),
            _buildUploadSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAccountSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Nomor Rekening',
            style: AppTextStyle.h3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _bankAccountNumber,
                style: AppTextStyle.bodyLarge.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, size: 16, color: Colors.grey.shade500),
                onPressed: _onCopyAccountNumber,
                visualDensity: VisualDensity.compact,
              ),
              Text(
                'Copy',
                style: AppTextStyle.bodySmall.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyle.bodyMedium.copyWith(color: Colors.black87),
              children: [
                const TextSpan(text: 'Silahkan Transfer Sesuai Nominal\n'),
                TextSpan(
                  text: 'Rp ${CurrencyFormatter.format(widget.order.totalPrice)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text:
                      ' untuk Pembelian Obat ke Rekening yang tertera di atas',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadSection() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Upload Foto Bukti Transfer', style: AppTextStyle.h3),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _imageBytes != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 48,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Klik disini',
                          style: AppTextStyle.bodyMedium.copyWith(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
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
        child: AppButton(
          label: 'Kirim Bukti Transfer',
          isLoading: _isUploading,
          onPressed: (_imageBytes != null && !_isUploading) ? _onSubmit : null,
        ),
      ),
    );
  }
}
