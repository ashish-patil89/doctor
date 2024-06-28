import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_widget_transition}
/// A transition used to switch content of widgets.
/// eg. [AppBottomDialogView].
/// {@endtemplate}
class AppWidgetTransition extends StatelessWidget {
  /// {@macro app_widget_transition}
  const AppWidgetTransition({
    required this.child,
    super.key,
  });

  /// The content to be displayed.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      child: AppAnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            key: ValueKey<Key?>(child.key),
            opacity: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.5, 1),
              ),
            ),
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
