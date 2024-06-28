import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template switch_card}
/// The common switch card, used for displaying settings.
/// {@endtemplate}
class SwitchCard extends StatelessWidget {
  /// {@macro switch_card}
  const SwitchCard({
    required this.title,
    required this.onChange,
    required this.isSelected,
    this.icon,
    this.textColor,
    this.backgroundColor,
    this.activeSwitchColor,
    super.key,
  });

  /// The title to be displayed.
  final String title;

  /// The callback to be called when the card is tapped.
  final ValueChanged<bool> onChange;

  /// Whether the switch is selected or not.
  final bool isSelected;

  /// Icon for the displayed title.
  final Widget? icon;

  /// Color of text.
  final Color? textColor;

  /// Color of button background.
  final Color? backgroundColor;

  /// Color of active switch button.
  final Color? activeSwitchColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 350.ms,
      constraints: const BoxConstraints(
        minHeight: 45,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.black4,
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  icon!,
                  const Gap(AppSpacing.xs),
                ],
                Text(
                  title,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: textColor ?? AppColors.primaryBlack,
                  ),
                ),
              ],
            ),
            AppSwitch.primary(
              enabled: isSelected,
              onChange: onChange,
              activeColor: activeSwitchColor,
            ),
          ],
        ),
      ),
    );
  }
}
