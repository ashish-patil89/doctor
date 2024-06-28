import 'package:flutter/material.dart';

class ModalPage<T> extends Page<T> {
  const ModalPage({
    required this.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return StatefulModalRoute<T>(
      settings: this,
      backgroundColor: Colors.transparent,
      builder: (context) => _ModalTransition(child: child),
    );
  }
}

class _ModalTransition extends StatelessWidget {
  const _ModalTransition({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);

    return AnimatedBuilder(
      animation: route!.animation!,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: route.animation!.value,
          child: child,
        );
      },
      child: child,
    );
  }
}

/// This class is used to allow children to override the `enableDrag` property
/// of the [ModalBottomSheetRoute] class.
/// The main use case for that was to prevent swipe down gesture competing
/// with the [InteractiveViewer] widget inside the modal.
class StatefulModalRoute<T> extends ModalBottomSheetRoute<T> {
  StatefulModalRoute({
    required super.builder,
    super.capturedThemes,
    super.barrierLabel,
    super.barrierOnTapHint,
    super.backgroundColor,
    super.elevation,
    super.shape,
    super.clipBehavior,
    super.constraints,
    super.modalBarrierColor,
    super.isDismissible = true,
    super.enableDrag = true,
    super.showDragHandle,
    super.isScrollControlled = true,
    super.scrollControlDisabledMaxHeightRatio,
    super.settings,
    super.transitionAnimationController,
    super.anchorPoint,
    super.useSafeArea = false,
  });

  bool overrideEnableDrag = true;

  @override
  bool get enableDrag => overrideEnableDrag;

  void setOverrideEnableDrag({required bool enableDrag}) {
    overrideEnableDrag = enableDrag;

    // Trigger a rebuild of the navigator to apply the new value.
    navigator?.didChangeDependencies();
  }
}
