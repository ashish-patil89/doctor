import 'package:animations/animations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template open_container_wrapper}
/// A wrapper for [OpenContainer] transition animation.
/// {@endtemplate}
class OpenContainerWrapper extends StatelessWidget {
  /// {@macro open_container_wrapper}
  const OpenContainerWrapper({
    required this.openWidget,
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
    super.key,
  });

  /// The widget to show when the container is closed.
  final CloseContainerBuilder closedBuilder;

  /// The widget to show when the container clicked, [OpenContainerBuilder] is
  /// used to render the opening widget.
  final Widget openWidget;

  /// The type of transition to use when opening the container.
  final ContainerTransitionType transitionType;

  /// The callback to call when the container is closed.
  final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return openWidget;
      },
      onClosed: onClosed,
      transitionDuration: 350.ms,
      openColor: AppColors.primaryBlack,
      middleColor: AppColors.primaryBlack,
      closedColor: Colors.transparent,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
