import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BouncingCard extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const BouncingCard({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<BouncingCard> createState() => _BouncingCardState();
}

class _BouncingCardState extends State<BouncingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _hasBouncedOnView = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0.0,
      upperBound: 0.05,
    );
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
  }

  void _triggerBounce() {
    _controller.forward().then((_) => _controller.reverse());
  }

  void _onTapDown(TapDownDetails details) {
    _triggerBounce();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (!_hasBouncedOnView && info.visibleFraction > 0.1) {
          _triggerBounce();
          _hasBouncedOnView = true; // only first-time automatic bounce
        }
      },
      child: GestureDetector(
        onTapDown: _onTapDown, // bounce on tap/click
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 - _scaleAnimation.value,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.hardEdge,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
