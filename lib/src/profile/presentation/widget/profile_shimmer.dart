import 'package:flutter/material.dart';
import 'package:kud_shop/component/widgets/loading/shimmer_widget.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // shimmer header
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                // shimmer avatar
                ShimmerWidget.circular(size: 96),
                const SizedBox(height: 16),
                // shimmer nama
                const ShimmerWidget.rectangular(width: 160, height: 22),
                const SizedBox(height: 8),
                // shimmer posisi
                const ShimmerWidget.rectangular(width: 100, height: 14),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // shimmer card informasi pribadi
          _buildShimmerCard(),
          const SizedBox(height: 12),

          // shimmer card informasi pekerjaan
          _buildShimmerCard(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildShimmerCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          // shimmer judul card
          const ShimmerWidget.rectangular(width: 120, height: 13),
          const SizedBox(height: 16),
          // shimmer item 1
          _buildShimmerItem(),
          const SizedBox(height: 16),
          // shimmer item 2
          _buildShimmerItem(),
        ],
      ),
    );
  }

  Widget _buildShimmerItem() {
    return const Row(
      children: [
        // shimmer icon
        ShimmerWidget.rectangular(width: 20, height: 20),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // shimmer label
            ShimmerWidget.rectangular(width: 60, height: 12),
            SizedBox(height: 4),
            // shimmer value
            ShimmerWidget.rectangular(width: 180, height: 15),
          ],
        ),
      ],
    );
  }
}
