import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template option_card}
/// The common option card, used for displaying settings.
/// {@endtemplate}
class OptionCard extends StatelessWidget {
  /// {@macro option_card}
  const OptionCard({
    required this.onTap,
    required this.option,
    this.isSelected = false,
    this.icon,
    this.selectedTextColor = AppColors.primaryBlack,
    this.unselectedTextColor = AppColors.black38,
    this.isInDarkBackground = false,
    this.selectedBgColor,
    this.unselectedBgColor,
    this.checkboxColor,
    this.checkColor,
    super.key,
  });

  /// The option to be displayed.
  final String option;

  /// The callback to be called when the card is tapped.
  final GestureTapCallback onTap;

  /// Whether the option is selected or not.
  final bool isSelected;

  /// The icon to be displayed.
  final Widget? icon;

  /// Whether the card is in a dark background or not.
  final bool isInDarkBackground;

  /// The text color of the selected option.
  final Color selectedTextColor;

  /// The selected background color.
  final Color? selectedBgColor;

  /// The text color of the unselected option.
  final Color unselectedTextColor;

  /// The unselected background color.
  final Color? unselectedBgColor;

  /// The color of the checkbox.
  final Color? checkboxColor;

  /// The color of check mark.
  final Color? checkColor;

  @override
  Widget build(BuildContext context) {
    return ScaleOnTapView(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 350.ms,
        constraints: const BoxConstraints(
          minHeight: 45,
        ),
        padding: const EdgeInsets.all(
          AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? selectedBgColor ??
                  (isInDarkBackground ? AppColors.white12 : AppColors.menu)
              : unselectedBgColor ??
                  (isInDarkBackground
                      ? AppColors.white4
                      : AppColors.primaryWhite),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.black12,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...{
                  SizedBox(
                    width: 25,
                    height: 21,
                    child: icon,
                  ),
                  const Gap(AppSpacing.sm),
                },
                Text(
                  option,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: isSelected ? selectedTextColor : unselectedTextColor,
                  ),
                ),
              ],
            ),
            CircularCheckbox(
              isSelected: isSelected,
              isInDarkBackground: isInDarkBackground,
              checkBoxColor: checkboxColor,
              checkColor: checkColor,
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template toggle_option_card}
/// The common toggle option card, used for displaying settings.
/// {@endtemplate}
class ToggleOptionCard extends StatelessWidget {
  /// {@macro toggle_option_card}
  const ToggleOptionCard({
    required this.onTap,
    required this.option,
    required this.icon,
    this.isSelected = false,
    super.key,
  });

  /// The option to be displayed.
  final String option;

  /// The callback to be called when the card is tapped.
  final GestureTapCallback onTap;

  /// Whether the option is selected or not.
  final bool isSelected;

  /// The icon to be displayed.
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 350.ms,
      constraints: const BoxConstraints(
        minHeight: 45,
      ),
      decoration: BoxDecoration(
        color: AppColors.white4,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? null
            : Border.all(
                color: AppColors.black12,
              ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 22,
                  height: 21,
                  child: icon,
                ),
                const Gap(AppSpacing.xs),
                Text(
                  option,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: AppColors.primaryWhite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 7,
            bottom: 7,
            right: 12,
            child: AppSwitch.primary(
              enabled: isSelected,
              onChange: (value) => onTap.call(),
              activeColor: AppColors.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}
