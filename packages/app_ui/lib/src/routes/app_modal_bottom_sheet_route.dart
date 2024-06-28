// ignore_for_file: prefer_asserts_with_message

import 'package:flutter/material.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

/// {@template app_modal_bottom_sheet_route}
/// A custom [ModalBottomSheetRoute] that provides a gradient modal barrier.
/// {@endtemplate}
class AppModalBottomSheetRoute<T> extends ModalBottomSheetRoute<T> {
  /// {@macro app_modal_bottom_sheet_route}
  AppModalBottomSheetRoute({
    required super.builder,
    required super.isScrollControlled,
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
    super.scrollControlDisabledMaxHeightRatio =
        _defaultScrollControlDisabledMaxHeightRatio,
    super.settings,
    super.transitionAnimationController,
    super.anchorPoint,
    super.useSafeArea = false,
  });

  @override
  Widget buildModalBarrier() {
    final animation = this.animation;

    if (animation != null) {
      return Builder(
        builder: (context) {
          return GestureDetector(
            onTap: isDismissible ? Navigator.of(context).maybePop : null,
            child: FadeTransition(
              opacity: animation,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return super.buildModalBarrier();
  }
}

/// Shows the app modal bottom sheet with [AppModalBottomSheetRoute].
Future<T?> showAppModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  RouteSettings? routeSettings,
  bool isDismissable = true,
  bool enableDrag = true,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final navigator = Navigator.of(context);
  final localizations = MaterialLocalizations.of(context);

  return navigator.push(
    AppModalBottomSheetRoute<T>(
      builder: builder,
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      isScrollControlled: true,
      barrierOnTapHint:
          localizations.scrimOnTapHint(localizations.bottomSheetLabel),
      backgroundColor: Colors.transparent,
      elevation: 0,
      modalBarrierColor: Colors.transparent,
      settings: routeSettings,
      useSafeArea: true,
      isDismissible: isDismissable,
      enableDrag: enableDrag,
    ),
  );
}
