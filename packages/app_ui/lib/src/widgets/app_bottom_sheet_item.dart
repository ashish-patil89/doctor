import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_bottom_sheet_item}
/// A widget that represents an item in the bottom sheet.
/// {@endtemplate}
class AppBottomSheetItem extends StatelessWidget {
  /// {@macro app_bottom_sheet_item}
  const AppBottomSheetItem({
    required this.icon,
    required this.onTap,
    required this.title,
    super.key,
  });

  /// The icon of this item.
  final Widget icon;

  /// The title of this item.
  final String title;

  /// The callback for when this item is tapped.
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ScaleOnTapView(
      onTap: onTap,
      tapScale: 0.94,
      child: Row(
        children: [
          icon,
          const Gap(AppSpacing.sm),
          Text(
            title,
            textAlign: TextAlign.left,
            style: AppTextStyles.headline1.copyWith(
              color: AppColors.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
