import 'package:flutter/material.dart';
import 'package:kud_shop/component/widgets/loading/shimmer_widget.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header shimmer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
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
                // Avatar
                ShimmerWidget.circular(size: 96),
                const SizedBox(height: 16),
                // Nama
                const ShimmerWidget.rectangular(width: 160, height: 20),
                const SizedBox(height: 8),
                // Badge role
                const ShimmerWidget.rectangular(width: 80, height: 24),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Info card shimmer
          Container(
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
                const ShimmerWidget.rectangular(width: 120, height: 14),
                const SizedBox(height: 16),
                _shimmerInfoRow(),
                const Divider(height: 24),
                _shimmerInfoRow(),
                const Divider(height: 24),
                _shimmerInfoRow(),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Menu buttons shimmer
          for (int i = 0; i < 4; i++) ...[
            // ignore: prefer_const_constructors
            ShimmerWidget.rectangular(width: double.infinity, height: 56),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }

  Widget _shimmerInfoRow() {
    return const Row(
      children: [
        ShimmerWidget.rectangular(width: 36, height: 36),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidget.rectangular(width: 80, height: 12),
            SizedBox(height: 6),
            ShimmerWidget.rectangular(width: 160, height: 16),
          ],
        ),
      ],
    );
  }
}
