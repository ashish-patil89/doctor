import 'package:flutter/material.dart';

/// Adds a pulsing animation to the [child] widget
/// in specified [duration] duration.
///
/// [child] and [duration] arguments must not be null.
class PulsingWidget extends StatefulWidget {
  /// Creates a widget that rotates [child] in specified [duration] duration.
  const PulsingWidget({
    required this.child,
    required this.duration,
    super.key,
  });

  /// The widget to animate.
  final Widget child;

  /// The duration to complete a single pulse.
  final Duration duration;

  @override
  State<PulsingWidget> createState() => _PulsingWidgetState();
}

class _PulsingWidgetState extends State<PulsingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.9,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
