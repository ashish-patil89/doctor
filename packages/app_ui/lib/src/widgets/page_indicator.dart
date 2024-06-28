import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// {@template page_indicator}
/// The common page indicator for displaying indicator on page view.
/// {@endtemplate}
class PageIndicator extends StatelessWidget {
  /// {@macro page_indicator}
  const PageIndicator({
    required this.pageController,
    required this.length,
    super.key,
  });

  /// The required page controller.
  final PageController pageController;

  /// The length pages.
  final int length;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: length,
      effect: const WormEffect(
        dotHeight: AppSpacing.sm,
        dotWidth: AppSpacing.sm,
        spacing: AppSpacing.xs,
        dotColor: AppColors.white12,
        activeDotColor: AppColors.primaryWhite,
        type: WormType.thinUnderground,
      ),
    );
  }
}
