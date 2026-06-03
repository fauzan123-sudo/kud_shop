import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  // ← bentuk persegi panjang
  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
  }) : borderRadius = null;

  // ← bentuk lingkaran (untuk avatar)
  ShimmerWidget.circular({
    super.key,
    required double size,
  })  : width = size,
        height = size,
        borderRadius = BorderRadius.all(Radius.circular(size / 2));

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}