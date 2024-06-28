import 'package:flutter/material.dart';

/// Rotates [child] widget in specified [duration] duration.
///
/// [child] and [duration] arguments must not be null.
class RotatingWidget extends StatefulWidget {
  /// Creates a widget that rotates [child] in specified [duration] duration.
  const RotatingWidget({
    required this.child,
    required this.duration,
    super.key,
  });

  /// The widget to rotate.
  final Widget child;

  /// The duration to complete a single rotation.
  final Duration duration;

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        _controller,
      ),
      child: widget.child,
    );
  }
}
