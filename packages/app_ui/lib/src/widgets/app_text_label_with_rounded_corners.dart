import 'dart:core';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_text_label_with_rounded_corners}
/// The custom text with label, rounded corners and icon.
/// {@endtemplate}
class AppTextLabelWithRoundedCorners extends StatelessWidget {
  /// {@macro app_text_label_with_rounded_corner}
  const AppTextLabelWithRoundedCorners._({
    required this.text1,
    super.key,
    this.text2 = '',
    this.icon,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.tint,
    this.borderRadius,
    this.padding,
    this.onTap,
  });

  /// The primary app-text-label-with-rounded-icon.
  const AppTextLabelWithRoundedCorners.primary({
    String? text1,
    String? text2,
    SvgGenImage? icon,
    double? width,
    Color? backgroundColor,
    Color? textColor,
    Color? tint,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    GestureTapCallback? onTap,
    Key? key,
  }) : this._(
          key: key,
          text1: text1 ?? '',
          text2: text2 ?? '',
          icon: icon,
          width: width ?? double.infinity,
          backgroundColor: backgroundColor ?? Colors.transparent,
          tint: tint ?? AppColors.primaryBlack,
          textColor: textColor ?? AppColors.primaryBlack,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(31)),
          padding: padding,
          onTap: onTap,
        );

  /// The primary text.
  final String text1;

  /// The second text.
  final String text2;

  /// The icon with label.
  final SvgGenImage? icon;

  /// The width of label.
  final double? width;

  /// The backgroundColor of label.
  final Color? backgroundColor;

  /// The textColor of label.
  final Color? textColor;

  /// The tint of icon.
  final Color? tint;

  /// The borderRadius of background.
  final BorderRadius? borderRadius;

  /// The padding of label.
  final EdgeInsets? padding;

  /// The onTap of callback handler.
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ScaleOnTapView(
      tapScale: 0.96,
      onTap: onTap,
      isScaleOnTapEnabled: onTap != null,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        height: AppSpacing.spacing37,
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: AppTextStyles.bodyText1.copyWith(
                  color: textColor ?? AppColors.primaryBlack,
                ),
              ),
              if (icon != null) ...[
                if (text1.isNotEmpty) ...[
                  const Gap(AppSpacing.xs),
                ],
                icon!.svg(
                  colorFilter:
                      ColorFilter.mode(tint ?? Colors.white, BlendMode.srcIn),
                ),
              ],
              if (text2.isNotEmpty) ...[
                const Gap(AppSpacing.xs),
                Flexible(
                  child: Text(
                    text2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyText1.copyWith(
                      color: textColor ?? AppColors.primaryBlack,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
