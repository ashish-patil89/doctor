import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template no_data_found}
/// A widget for handling cases where no data is available.
/// {@endtemplate}
class NoDataFound extends StatelessWidget {
  /// {@macro no_data_found}
  const NoDataFound({
    required this.text,
    this.textColor,
    this.isFullScreen = true,
    super.key,
  });

  /// The text to display.
  final String text;

  /// The text color.
  final Color? textColor;

  /// Helps to identify whether the widget should take up the entire screen.
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      height: isFullScreen ? context.height * 0.8 : null,
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTextStyles.bodyText2.copyWith(
          color: textColor ?? AppColors.primaryWhite,
        ),
      ),
    ).animate().fadeIn(
          duration: 350.ms,
          curve: Curves.easeInOut,
        );
  }
}
