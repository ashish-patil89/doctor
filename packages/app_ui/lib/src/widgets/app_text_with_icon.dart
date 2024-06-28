import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_text_with_icon}
/// The app text with icon.
/// {@endtemplate}
class AppTextWithIcon extends StatelessWidget {
  /// {@macro app_text_with_icon}
  const AppTextWithIcon._({
    this.text,
    this.icon,
    this.iconTint,
    this.isIconPostfix,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.textStyle,
    this.iconWidth,
    this.iconHeight,
    this.iconPadding,
    this.iconPng,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.onTap,
    super.key,
  });

  /// The primary text with icon.
  const AppTextWithIcon.primary({
    required String? text,
    SvgGenImage? icon,
    Color? iconTint,
    bool? isIconPostfix,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    TextStyle? textStyle,
    double? iconWidth,
    double? iconHeight,
    EdgeInsets? iconPadding,
    GestureTapCallback? onTap,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          icon: icon,
          iconTint: iconTint ?? AppColors.primaryBlack,
          isIconPostfix: isIconPostfix ?? false,
          padding: padding ?? EdgeInsets.zero,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor ?? Colors.transparent,
          textStyle: textStyle ?? AppTextStyles.caption,
          iconWidth: iconWidth ?? AppSpacing.lg,
          iconHeight: iconHeight ?? AppSpacing.lg,
          iconPadding: iconPadding ?? EdgeInsets.zero,
          onTap: onTap,
        );

  /// The primary png text with icon.
  const AppTextWithIcon.primaryPng({
    required String? text,
    AssetGenImage? iconPng,
    Color? iconTint,
    bool? isIconPostfix,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    TextStyle? textStyle,
    double? iconWidth,
    double? iconHeight,
    EdgeInsets? iconPadding,
    GestureTapCallback? onTap,
    MainAxisSize? mainAxisSize,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          iconPng: iconPng,
          iconTint: iconTint ?? AppColors.primaryBlack,
          isIconPostfix: isIconPostfix ?? false,
          padding: padding ?? EdgeInsets.zero,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor ?? Colors.transparent,
          textStyle: textStyle ?? AppTextStyles.caption,
          iconWidth: iconWidth ?? AppSpacing.lg,
          iconHeight: iconHeight ?? AppSpacing.lg,
          iconPadding: iconPadding ?? EdgeInsets.zero,
          onTap: onTap,
          mainAxisSize: mainAxisSize,
        );

  /// The left align text with post fix icon.
  const AppTextWithIcon.leftAlignPostfixIcon({
    required String? text,
    SvgGenImage? icon,
    Color? iconTint,
    bool? isIconPostfix,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    TextStyle? textStyle,
    double? iconWidth,
    double? iconHeight,
    EdgeInsets? iconPadding,
    GestureTapCallback? onTap,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          icon: icon,
          iconTint: iconTint ?? AppColors.primaryWhite,
          isIconPostfix: isIconPostfix ?? true,
          padding: padding ?? EdgeInsets.zero,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor ?? Colors.transparent,
          textStyle: textStyle ?? AppTextStyles.caption,
          iconWidth: iconWidth ?? AppSpacing.md,
          iconHeight: iconHeight ?? AppSpacing.spacing26,
          iconPadding: iconPadding ??
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
              ),
          mainAxisAlignment: MainAxisAlignment.start,
          onTap: onTap,
        );

  /// The primary text label.
  final String? text;

  /// The icon used as label prefix suffix.
  final SvgGenImage? icon;

  /// The tint for icon.
  final Color? iconTint;

  /// Is icon used as post fix.
  final bool? isIconPostfix;

  /// The background color.
  final Color? backgroundColor;

  /// The borderRadius for corners.
  final BorderRadius? borderRadius;

  /// The padding.
  final EdgeInsets? padding;

  /// The style of text
  final TextStyle? textStyle;

  /// The width of icon
  final double? iconWidth;

  /// The height of icon
  final double? iconHeight;

  /// The padding of icon
  final EdgeInsets? iconPadding;

  /// The png icon used.
  final AssetGenImage? iconPng;

  /// The callback when tapped.
  final GestureTapCallback? onTap;

  /// The mainAxisAlignment of text.
  final MainAxisAlignment? mainAxisAlignment;

  /// The mainAxisSize of text.
  final MainAxisSize? mainAxisSize;

  @override
  Widget build(BuildContext context) {
    final postfixIcon = isIconPostfix ?? false;
    return ScaleOnTapView(
      tapScale: 0.94,
      onTap: onTap,
      isScaleOnTapEnabled: onTap != null,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.xmlg),
        ),
        height: 37,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            mainAxisSize: mainAxisSize ?? MainAxisSize.max,
            children: [
              if (!postfixIcon) ...[
                if (icon != null)
                  Padding(
                    padding: iconPadding ?? EdgeInsets.zero,
                    child: icon!.svg(
                      colorFilter: ColorFilter.mode(
                        iconTint ?? Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: iconWidth,
                      height: iconHeight,
                    ),
                  ),
                if (iconPng != null)
                  Padding(
                    padding: iconPadding ?? EdgeInsets.zero,
                    child: iconPng!.image(
                      width: iconWidth,
                      height: iconHeight,
                    ),
                  ),
              ],
              Text(
                text ?? '',
                style: textStyle,
              ),
              if (postfixIcon)
                if (icon != null)
                  Padding(
                    padding: iconPadding ?? EdgeInsets.zero,
                    child: icon!.svg(
                      colorFilter: ColorFilter.mode(
                        iconTint ?? Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: iconWidth,
                      height: iconHeight,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
