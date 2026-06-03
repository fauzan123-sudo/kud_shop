import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/component/widgets/loading/shimmer_widget.dart';

class EmployeeShimmer extends StatelessWidget {
  const EmployeeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 8, // ← tampilkan 8 skeleton card
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, __) => Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // ← shimmer avatar
              ShimmerWidget.circular(size: 48),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ← shimmer nama
                    ShimmerWidget.rectangular(
                      width: double.infinity,
                      height: 14,
                    ),
                    SizedBox(height: 8),
                    // ← shimmer posisi
                    ShimmerWidget.rectangular(width: 120, height: 12),
                    SizedBox(height: 8),
                    // ← shimmer departemen badge
                    ShimmerWidget.rectangular(width: 80, height: 20),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // ← shimmer status
              Column(
                children: [
                  ShimmerWidget.circular(size: 8),
                  const SizedBox(height: 4),
                  const ShimmerWidget.rectangular(width: 30, height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
