import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template app_confirmation_bottom_sheet_view}
/// The app confirmation bottom sheet view.
/// {@endtemplate}
class AppConfirmationBottomSheetView extends StatelessWidget {
  /// {@macro app_confirmation_bottom_sheet_view}
  const AppConfirmationBottomSheetView({
    required this.message,
    required this.cancelButtonText,
    required this.confirmButtonText,
    super.key,
  });

  /// The message to be displayed in the bottom sheet.
  final String message;

  /// The text to be displayed in cancel button.
  final String cancelButtonText;

  /// The text to be displayed in go back button.
  final String confirmButtonText;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 250.ms,
      decoration: const BoxDecoration(
        color: AppColors.primaryBlack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.xlg),
          topRight: Radius.circular(AppSpacing.xlg),
        ),
      ),
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.xxlg,
        bottom: AppSpacing.xxlg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText1,
          ),
          const Gap(AppSpacing.xmlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton.text(
                  child: Text(
                    cancelButtonText,
                    style: AppTextStyles.subheadline,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
              const Gap(AppSpacing.smd),
              Expanded(
                child: AppButton.text(
                  child: Text(
                    confirmButtonText,
                    style: AppTextStyles.callout,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
