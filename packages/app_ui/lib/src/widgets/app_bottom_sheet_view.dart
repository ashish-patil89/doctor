import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_bottom_sheet_view}
/// The app bottom sheet dialog.
/// {@endtemplate}
class AppBottomSheetView extends StatelessWidget {
  /// {@macro app_bottom_sheet_view}
  const AppBottomSheetView({
    required this.child,
    this.title,
    this.padding,
    this.isBlackBackground = false,
    super.key,
  });

  /// The title of this bottom sheet.
  final String? title;

  /// The child of this bottom sheet.
  final Widget child;

  /// The padding for child of this bottom sheet.
  final EdgeInsets? padding;

  /// Tells weather the background color of this bottom sheet
  /// is [AppColors.primaryBlack].
  final bool isBlackBackground;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
            ),
        child: Column(
          children: [
            const Gap(AppSpacing.smd),
            Container(
              width: 26,
              height: 4,
              decoration: BoxDecoration(
                color: isBlackBackground ? AppColors.white38 : AppColors.black8,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const SizedBox(),
            ),
            const Gap(AppSpacing.smd),
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: AppTextStyles.headline3.copyWith(
                  color: isBlackBackground
                      ? AppColors.primaryWhite
                      : AppColors.primaryBlack,
                ),
              ),
              const Gap(AppSpacing.md),
            ],
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
