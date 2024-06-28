import 'package:flutter/widgets.dart';

/// {@template app_animated_switcher}
/// Common animated switcher for the app.
/// {@endtemplate}
class AppAnimatedSwitcher extends StatelessWidget {
  /// {@macro app_animated_switcher}
  const AppAnimatedSwitcher({
    required this.child,
    this.duration = defaultDuration,
    this.reverseDuration = defaultDuration,
    this.switchInCurve = Curves.easeInOut,
    this.switchOutCurve = Curves.easeInOut,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    super.key,
  });

  /// The default duration for the animation.
  static const defaultDuration = Duration(milliseconds: 350);

  /// The widget to animate.
  final Widget? child;

  /// The duration of the animation.
  final Duration duration;

  /// The reverse duration of the animation.
  final Duration reverseDuration;

  /// The transition builder for the animation.
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  /// The layout builder for the animation.
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  /// The curve for the switch in animation.
  final Curve switchInCurve;

  /// The curve for the switch out animation.
  final Curve switchOutCurve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
      child: child,
    );
  }
}
