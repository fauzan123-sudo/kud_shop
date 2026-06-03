import 'package:flutter/material.dart';
import 'package:kud_shop/component/widgets/loading/shimmer_widget.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // shimmer welcome banner
          const ShimmerWidget.rectangular(width: double.infinity, height: 100),
          const SizedBox(height: 24),

          // shimmer label
          const ShimmerWidget.rectangular(width: 100, height: 16),
          const SizedBox(height: 12),

          // shimmer summary grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: List.generate(
              4,
              (_) => Container(
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(width: 24, height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget.rectangular(width: 60, height: 22),
                        SizedBox(height: 4),
                        ShimmerWidget.rectangular(width: 80, height: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // shimmer label menu cepat
          const ShimmerWidget.rectangular(width: 100, height: 16),
          const SizedBox(height: 12),

          // shimmer quick menu
          ...List.generate(
            2,
            (_) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
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
              child: const Row(
                children: [
                  ShimmerWidget.rectangular(width: 44, height: 44),
                  SizedBox(width: 12),
                  ShimmerWidget.rectangular(width: 120, height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
