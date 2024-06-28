import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_button}
/// The app button.
/// {@endtemplate}
class AppButtonOutlined extends StatelessWidget {
  /// {@macro app_button}
  const AppButtonOutlined._({
    required this.title,
    required this.minimumSize,
    super.key,
    this.icon,
    this.suffixChild,
    this.iconPadding,
    this.onPressed,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    this.borderSide,
    double? elevation,
    this.textStyle,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    bool? withTransparentBackground,
    this.secondary,
    this.animate,
    this.subtitle,
  })  : buttonColor = buttonColor ?? AppColors.menu,
        disabledButtonColor = disabledButtonColor ?? AppColors.white12,
        foregroundColor = foregroundColor ?? AppColors.primaryWhite,
        disabledForegroundColor = disabledForegroundColor ?? AppColors.white38,
        elevation = elevation ?? 0,
        padding = padding ?? EdgeInsets.zero,
        borderRadius = borderRadius ?? BorderRadius.zero,
        withTransparentBackground = withTransparentBackground ?? false;

  /// The primary button.
  const AppButtonOutlined.primary({
    Widget? title,
    Widget? subtitle,
    Widget? icon,
    Widget? suffixChild,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    EdgeInsets? padding,
    bool? withTransparentBackground,
    Color? buttonColor,
    BorderRadius? borderRadius,
    Size? minSize,
    bool? animate,
    Widget? secondary,
    BorderSide? borderSide,
  }) : this._(
          key: key,
          title: title ?? const SizedBox(),
          subtitle: subtitle,
          icon: icon,
          suffixChild: suffixChild,
          padding: padding ?? const EdgeInsets.all(AppSpacing.md),
          iconPadding: iconPadding,
          /*maximumSize: maxSize == null
              ? secondary == null
                  ? const Size(
                      double.infinity,
                      148,
                    )
                  : const Size(
                      double.infinity,
                      AppSpacing.spacing108,
                    )
              : const Size(
                  double.infinity,
                  AppSpacing.spacing108,
                ),*/
          minimumSize: minSize ?? const Size(0, 45),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.menu,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.black12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(AppSpacing.md),
              ),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          animate: animate ?? true,
          secondary: secondary,
          borderSide: borderSide ??
              const BorderSide(
                color: AppColors.menu,
              ),
        );

  /// The [VoidCallback] called when this button is pressed.
  ///
  /// The button is disabled when [onPressed] is null.
  final VoidCallback? onPressed;

  /// The background color of this button.
  ///
  /// Defaults to [Colors.white].
  final Color buttonColor;

  /// The disabled background color of this button.
  ///
  /// Defaults to [AppColors.white12].
  final Color? disabledButtonColor;

  /// The color of the text, icons etc.
  ///
  /// Defaults to [AppColors.white38].
  final Color foregroundColor;

  /// The color of the disabled text, icons etc.
  ///
  /// Defaults to [AppColors.white38].
  final Color disabledForegroundColor;

  /// The border of this button.
  final BorderSide? borderSide;

  /// The elevation of this button.
  final double elevation;

  /// The [TextStyle] of this button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? textStyle;

  /*/// The maximum size of this button.
  final Size maximumSize;*/

  /// The minimum size of this button.
  final Size minimumSize;

  /// The padding of this button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets padding;

  /// The border radius of this button.
  final BorderRadius borderRadius;

  /// Whether this button has a transparent background.
  final bool withTransparentBackground;

  /// The [Widget] displayed on the button.
  final Widget title;

  /// The [Widget] displayed on the button.
  final Widget? subtitle;

  /// The icon [Widget] displayed on the button.
  final Widget? icon;

  /// The icon [Widget] displayed on the button.
  final Widget? secondary;

  /// The icon [Widget] displayed on the button.
  final Widget? suffixChild;

  /// The padding between the icon and the text.
  final EdgeInsets? iconPadding;

  /// The animation on button press.
  final bool? animate;

  static const _transitionAnimationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return ScaleOnTapView(
      isScaleOnTapEnabled: onPressed != null,
      tapScale: animate ?? true ? 0.92 : 1,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minimumSize.width,
          minHeight: minimumSize.height,
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            // Allow the button to be smaller than 48x48.
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //maximumSize: MaterialStateProperty.all(double.infinity),
            minimumSize: MaterialStateProperty.all(minimumSize),
            padding: MaterialStateProperty.all(padding),
            textStyle: MaterialStateProperty.all(
              textStyle ?? Theme.of(context).textTheme.labelLarge,
            ),
            backgroundColor: withTransparentBackground
                ? MaterialStateProperty.all(Colors.transparent)
                : (onPressed == null
                    ? MaterialStateProperty.all(disabledButtonColor)
                    : MaterialStateProperty.all(buttonColor)),
            elevation: MaterialStateProperty.all(elevation),
            foregroundColor: onPressed == null
                ? MaterialStateProperty.all(disabledForegroundColor)
                : MaterialStateProperty.all(foregroundColor),
            side: MaterialStateProperty.all(borderSide),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
            ),
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        AppAnimatedSwitcher(
                          duration: _transitionAnimationDuration,
                          child: icon ?? const SizedBox(),
                        ),
                        Flexible(
                          child: AppAnimatedSwitcher(
                            duration: _transitionAnimationDuration,
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return SizeTransition(
                                sizeFactor: CurvedAnimation(
                                  curve: const Interval(0, 1),
                                  parent: animation,
                                ),
                                axisAlignment: 1,
                                axis: Axis.horizontal,
                                child: FadeTransition(
                                  opacity: CurvedAnimation(
                                    curve: const Interval(0.15, 1),
                                    parent: animation,
                                  ),
                                  child: child,
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              key: Key('${title.key}_container'),
                              child: Padding(
                                padding: iconPadding ??
                                    (icon != null && title is! SizedBox
                                        ? const EdgeInsets.only(
                                            left: AppSpacing.xs,
                                          )
                                        : EdgeInsets.zero),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    title,
                                    if (subtitle != null)
                                      const Gap(AppSpacing.xs),
                                    subtitle ?? const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppAnimatedSwitcher(
                    duration: _transitionAnimationDuration,
                    child: suffixChild ?? const SizedBox(),
                  ),
                ],
              ),
              if (secondary != null) const Gap(AppSpacing.md),
              secondary ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
