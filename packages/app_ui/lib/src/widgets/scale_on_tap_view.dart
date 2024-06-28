import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template scale_on_tap_view}
/// A widget that scales its child on tap.
/// {@endtemplate}
class ScaleOnTapView extends StatefulWidget {
  /// {@macro scale_on_tap_view}
  const ScaleOnTapView({
    required this.child,
    this.isScaleOnTapEnabled = true,
    this.tapScale = 0.92,
    this.scaleAlignment = Alignment.center,
    this.onTap,
    this.tapAnimationController,
    super.key,
  });

  /// The child widget.
  final Widget child;

  /// Whether tapping on this widget should scale it.
  ///
  /// If `false`, [tapAnimationController] can be provided
  /// to animate the scale of this widget.
  final bool isScaleOnTapEnabled;

  /// The scale factor to apply on tap.
  final double tapScale;

  /// The alignment of the scale.
  final Alignment scaleAlignment;

  /// The optional callback to call on tap.
  final VoidCallback? onTap;

  /// The optional animation controller.
  final AnimationController? tapAnimationController;

  @override
  State<ScaleOnTapView> createState() => _ScaleOnTapViewState();
}

class _ScaleOnTapViewState extends State<ScaleOnTapView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const _tapAnimationDuration = Duration(milliseconds: 120);

  @override
  void initState() {
    super.initState();

    _controller = widget.tapAnimationController ??
        AnimationController(
          duration: _tapAnimationDuration,
          vsync: this,
        );
  }

  @override
  void dispose() {
    if (widget.tapAnimationController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown:
          widget.isScaleOnTapEnabled ? (_) => _controller.forward() : null,
      onPointerCancel: widget.isScaleOnTapEnabled
          ? (_) =>
              _controller.forward().whenComplete(() => _controller.reverse())
          : null,
      onPointerUp: widget.isScaleOnTapEnabled
          ? (_) => mounted
              ? _controller.forward().whenComplete(() => _controller.reverse())
              : null
          : null,
      child: GestureDetector(
        onTap: widget.onTap != null
            ? () {
                widget.onTap?.call();
                HapticFeedback.lightImpact();
              }
            : null,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ScaleTransition(
            scale: Tween<double>(begin: 1, end: widget.tapScale).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
              ),
            ),
            alignment: widget.scaleAlignment,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
