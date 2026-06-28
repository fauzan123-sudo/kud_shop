import 'package:flutter/material.dart';

class CartFlyAnimation {
  static OverlayEntry? _overlayEntry;

  static void fly({
    required BuildContext context,
    required GlobalKey fromKey,
    required String imageUrl,
  }) {
    final RenderBox? fromBox =
        fromKey.currentContext?.findRenderObject() as RenderBox?;
    if (fromBox == null) return;

    final fromOffset = fromBox.localToGlobal(
      Offset(fromBox.size.width / 2, fromBox.size.height / 2),
    );

    final screenSize = MediaQuery.of(context).size;
    // Posisi tengah bottom nav (icon keranjang = index 1 dari 3)
    final toOffset = Offset(screenSize.width / 2, screenSize.height - 40);

    _overlayEntry = OverlayEntry(
      builder: (context) => _FlyingWidget(
        fromOffset: fromOffset,
        toOffset: toOffset,
        imageUrl: imageUrl,
        onComplete: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}

class _FlyingWidget extends StatefulWidget {
  final Offset fromOffset;
  final Offset toOffset;
  final String imageUrl;
  final VoidCallback onComplete;

  const _FlyingWidget({
    required this.fromOffset,
    required this.toOffset,
    required this.imageUrl,
    required this.onComplete,
  });

  @override
  State<_FlyingWidget> createState() => _FlyingWidgetState();
}

class _FlyingWidgetState extends State<_FlyingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnim;
  late Animation<double> _sizeAnim;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _positionAnim = Tween<Offset>(
      begin: widget.fromOffset,
      end: widget.toOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _sizeAnim = Tween<double>(
      begin: 60,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _opacityAnim = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward().then((_) => widget.onComplete());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _positionAnim.value.dx - _sizeAnim.value / 2,
          top: _positionAnim.value.dy - _sizeAnim.value / 2,
          child: Opacity(
            opacity: _opacityAnim.value,
            child: Container(
              width: _sizeAnim.value,
              height: _sizeAnim.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }
}
