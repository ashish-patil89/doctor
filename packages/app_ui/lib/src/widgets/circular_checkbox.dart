import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template circular_checkbox}
/// A custom circular check box widget.
/// {@endtemplate}
class CircularCheckbox extends StatelessWidget {
  /// {@macro circular_checkbox}
  const CircularCheckbox({
    this.isSelected = false,
    this.isInDarkBackground = false,
    this.checkBoxColor,
    this.checkColor,
    super.key,
  });

  /// Whether the checkbox is selected or not.
  final bool isSelected;

  /// Whether the checkbox is in dark background or not.
  final bool isInDarkBackground;

  /// The color of the checkbox.
  final Color? checkBoxColor;

  /// The color of check mark.
  final Color? checkColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 350.ms,
      width: 19.92,
      height: 19.92,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: checkBoxColor ??
            (isSelected
                ? AppColors.primaryGreen
                : isInDarkBackground
                    ? Colors.transparent
                    : AppColors.primaryWhite),
        shape: BoxShape.circle,
        border: isSelected
            ? null
            : Border.all(
                color:
                    isInDarkBackground ? AppColors.white12 : AppColors.black12,
              ),
      ),
      child: isSelected
          ? Assets.icons.check.svg(
              height: 12,
              colorFilter: checkColor != null
                  ? ColorFilter.mode(
                      checkColor!,
                      BlendMode.srcIn,
                    )
                  : null,
            )
          : const SizedBox.shrink(),
    );
  }
}
