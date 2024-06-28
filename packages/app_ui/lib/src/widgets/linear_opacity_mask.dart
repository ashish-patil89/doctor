import 'package:flutter/material.dart';

/// {@template linear_opacity_mask}
/// A widget that applies a linear gradient opacity mask to its child.
/// {@endtemplate}
class LinearOpacityMask extends StatelessWidget {
  /// {@macro linear_opacity_mask}
  const LinearOpacityMask({
    required this.child,
    required this.beginAlignment,
    required this.endAlignment,
    this.endColor = Colors.transparent,
    super.key,
  });

  /// The widget to apply the mask to.
  final Widget child;

  /// The alignment of the gradient at the beginning of the mask.
  final Alignment beginAlignment;

  /// The alignment of the gradient at the end of the mask.
  final Alignment endAlignment;

  /// The color of the gradient at the end of the mask.
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: beginAlignment,
          end: endAlignment,
          colors: [Colors.white, endColor],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}

/// {@template animated_linear_opacity_mask}
/// A widget that applies a linear gradient opacity mask to its child.
///
/// Currently supports animating [endColor] of the gradient on change.
/// {@endtemplate}
class AnimatedLinearOpacityMask extends StatefulWidget {
  /// {@macro linear_opacity_mask}
  const AnimatedLinearOpacityMask({
    required this.child,
    required this.beginAlignment,
    required this.endAlignment,
    required this.endColor,
    super.key,
  });

  /// The widget to apply the mask to.
  final Widget child;

  /// The alignment of the gradient at the beginning of the mask.
  final Alignment beginAlignment;

  /// The alignment of the gradient at the end of the mask.
  final Alignment endAlignment;

  /// The animated color of the gradient at the end of the mask.
  final Color endColor;

  @override
  State<AnimatedLinearOpacityMask> createState() =>
      _AnimatedLinearOpacityMaskState();
}

class _AnimatedLinearOpacityMaskState extends State<AnimatedLinearOpacityMask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<Color?> _endColorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _endColorAnimation = ConstantTween(widget.endColor).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedLinearOpacityMask oldWidget) {
    super.didUpdateWidget(oldWidget);

    _endColorAnimation = ColorTween(
      begin: oldWidget.endColor,
      end: widget.endColor,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return LinearOpacityMask(
          beginAlignment: widget.beginAlignment,
          endAlignment: widget.endAlignment,
          endColor: _endColorAnimation.value ?? Colors.transparent,
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}

/// {@template linear_horizontal_opacity_mask}
/// A widget that applies a linear horizontal gradient opacity mask to its
/// child.
/// {@endtemplate}
class LinearHorizontalOpacityMask extends StatelessWidget {
  /// {@macro linear_horizontal_opacity_mask}
  const LinearHorizontalOpacityMask({
    required this.child,
    required this.beginAlignment,
    required this.endAlignment,
    this.endColor = Colors.transparent,
    super.key,
  });

  /// The widget to apply the mask to.
  final Widget child;

  /// The alignment of the gradient at the beginning of the mask.
  final Alignment beginAlignment;

  /// The alignment of the gradient at the end of the mask.
  final Alignment endAlignment;

  /// The color of the gradient at the end of the mask.
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: beginAlignment,
          end: endAlignment,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(1),
            endColor,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}
