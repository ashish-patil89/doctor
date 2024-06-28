import 'dart:math';
import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_bottom_dialog_view_custom}
/// App bottom dialog with custom [child] content.
///
/// See also:
/// - [AppBottomDialogView], a predefined bottom dialog that can be used when
///   you need to show a dialog with an icon, title, description, and button.
/// {@endtemplate}
class AppBottomDialogViewCustom extends StatelessWidget {
  /// {@macro app_bottom_dialog_view_custom}
  const AppBottomDialogViewCustom({
    required this.child,
    this.onClose,
    this.onBack,
    this.canClose = true,
    super.key,
  });

  /// Custom content of the dialog.
  final Widget child;

  /// A callback when the dialog is closed.
  final VoidCallback? onClose;

  /// A callback when the back button is pressed.
  final VoidCallback? onBack;

  /// A flag to determine if the dialog can be closed, either via swipe down
  /// gesture or tapping the close button.
  final bool canClose;

  @override
  Widget build(BuildContext context) {
    return _PreventClosing(
      preventing: !canClose,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: context.bottomInset,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: AppSpacing.lg,
                          right: AppSpacing.lg,
                          bottom: AppSpacing.xs,
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.spacing32),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 27, sigmaY: 27),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.white38,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSpacing.spacing32),
                          ),
                          margin: const EdgeInsets.only(
                            left: AppSpacing.lg,
                            right: AppSpacing.lg,
                            bottom: AppSpacing.xs,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: AppSpacing.spacing14,
                              left: AppSpacing.md,
                              right: AppSpacing.md,
                              bottom: AppSpacing.md,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                child,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: AppSpacing.spacing14,
                      right: AppSpacing.lg + AppSpacing.spacing14,
                      child: IgnorePointer(
                        ignoring: !canClose,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: canClose ? 1 : 0,
                          child: ScaleOnTapView(
                            onTap: () {
                              onClose?.call();
                              Navigator.of(context).pop();
                            },
                            tapScale: 0.96,
                            child: Assets.icons.close.svg(
                              colorFilter: const ColorFilter.mode(
                                AppColors.white38,
                                BlendMode.srcIn,
                              ),
                              width: 21,
                              height: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppSpacing.spacing14,
                      left: AppSpacing.lg + AppSpacing.spacing14,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: onBack != null ? 1 : 0,
                        child: ScaleOnTapView(
                          onTap: onBack,
                          tapScale: 0.96,
                          child: Assets.icons.arrowLeft.svg(
                            colorFilter: const ColorFilter.mode(
                              AppColors.white38,
                              BlendMode.dstIn,
                            ),
                            width: 21,
                            height: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // This is added for smooth animation when opening/closing the
            // on screen keyboard.
            const Gap(AppSpacing.md),
            Gap(
              max(
                context.bottomPadding - AppSpacing.md,
                0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template app_bottom_dialog_view}
/// The app bottom dialog.
/// {@endtemplate}
class AppBottomDialogView extends StatelessWidget {
  /// {@macro app_bottom_dialog_view}
  const AppBottomDialogView({
    this.icon,
    this.title,
    this.description,
    this.button,
    this.onClose,
    this.onBack,
    this.canClose = true,
    super.key,
  });

  /// The icon of this bottom dialog.
  final Widget? icon;

  /// The title of this bottom dialog.
  final Widget? title;

  /// The description of this bottom dialog.
  final Widget? description;

  /// The button of this bottom dialog.
  final Widget? button;

  /// The callback when the dialog is closed.
  final VoidCallback? onClose;

  /// The callback when the back button is pressed.
  final VoidCallback? onBack;

  /// A flag to determine if the dialog can be closed, either via swipe down
  /// gesture or tapping the close button.
  final bool canClose;

  @override
  Widget build(BuildContext context) {
    return AppBottomDialogViewCustom(
      onClose: onClose,
      onBack: onBack,
      canClose: canClose,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (icon != null) ...[
            icon!,
            const Gap(AppSpacing.xs),
          ],
          if (title != null) ...[
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: AppTextStyles.headline2.copyWith(
                color: AppColors.primaryWhite,
              ),
              child: title!,
            ),
            const Gap(AppSpacing.xs),
          ],
          if (description != null) ...[
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.primaryWhite,
              ),
              child: description!,
            ),
          ],
          if (button != null) ...[
            const Gap(AppSpacing.slg),
            button!,
          ] else ...[
            const Gap(AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

/// {@template app_bottom_dialog_button}
/// A full-width button usually displayed at the bottom of the
/// [AppBottomDialogView].
/// {@endtemplate}
class AppBottomDialogButton extends StatelessWidget {
  /// {@macro app_bottom_dialog_button}
  const AppBottomDialogButton({
    required this.title,
    this.onPressed,
    this.isLoading = false,
    super.key,
  });

  /// Callback fired when button is pressed.
  final VoidCallback? onPressed;

  /// Flag to determine if the button is in loading state.
  final bool isLoading;

  /// The title of the button.
  final String title;

  @override
  Widget build(BuildContext context) {
    return _AppBottomDialogButtonLoadingOverlay(
      isLoading: isLoading,
      useWhiteLogo: isLoading,
      child: AppButton.detailFooterFullWidth(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
        ),
        buttonColor: AppColors.primaryWhite,
        childFlex: 1,
        onPressed: isLoading ? null : onPressed,
        child: Text(
          title,
          style: AppTextStyles.bodyText2Bold.copyWith(
            color: isLoading ? AppColors.black38 : AppColors.primaryBlack,
          ),
        ),
      ),
    );
  }
}

class _AppBottomDialogButtonLoadingOverlay extends StatelessWidget {
  const _AppBottomDialogButtonLoadingOverlay({
    required this.child,
    this.isLoading = false,
    this.useWhiteLogo = false,
  });

  final Widget child;
  final bool isLoading;
  final bool useWhiteLogo;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    } else {
      return Stack(
        children: [
          IgnorePointer(child: child),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Center(
              child: LoadingWidget(
                type: LoadingType.orb,
                useWhiteLogo: useWhiteLogo,
                height: 26,
              ),
            ),
          ),
        ],
      );
    }
  }
}

class _PreventClosing extends StatelessWidget {
  const _PreventClosing({
    required this.child,
    required this.preventing,
  });

  final Widget child;
  final bool preventing;

  @override
  Widget build(BuildContext context) {
    if (preventing) {
      return GestureDetector(
        /// Prevent closing the dialog when dragging down.
        onVerticalDragDown: (_) {},
        child: PopScope(
          canPop: false,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
