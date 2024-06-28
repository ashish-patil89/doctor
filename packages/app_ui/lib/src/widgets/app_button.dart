import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template app_button}
/// The app button.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro app_button}
  const AppButton._({
    required this.child,
    required this.maximumSize,
    required this.minimumSize,
    this.icon,
    this.iconPadding,
    this.onPressed,
    this.onDoublePressed,
    this.onLongPressed,
    this.isOpenBoxAnimation = false,
    this.tapScale = 0.92,
    this.borderSide,
    this.textStyle,
    this.showLoader = false,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    bool? withTransparentBackground,
    bool? withShadow,
    CrossAxisAlignment? crossAxisAlignment,
    int? childFlex,
    Alignment? childAlignment,
    super.key,
  })  : buttonColor = buttonColor ?? AppColors.white38,
        disabledButtonColor = disabledButtonColor ?? AppColors.white12,
        foregroundColor = foregroundColor ?? AppColors.primaryWhite,
        disabledForegroundColor = disabledForegroundColor ?? AppColors.white38,
        padding = padding ?? EdgeInsets.zero,
        borderRadius = borderRadius ?? BorderRadius.zero,
        withTransparentBackground = withTransparentBackground ?? false,
        crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center,
        withShadow = withShadow ?? false,
        childAlignment = childAlignment ?? Alignment.center,
        childFlex = childFlex ?? 0;

  /// The primary button.
  const AppButton.primary({
    Widget? child,
    int? childFlex,
    Widget? icon,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    EdgeInsets? padding,
    bool? isOpenBoxAnimation,
    bool? withShadow,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    double? tapScale,
    BorderRadius? radius,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          childFlex: childFlex,
          icon: icon,
          padding: padding ?? const EdgeInsets.all(18),
          maximumSize: const Size(double.infinity, 62),
          minimumSize: const Size(0, 62),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          disabledButtonColor: disabledButtonColor,
          foregroundColor: foregroundColor ?? AppColors.primaryWhite,
          disabledForegroundColor: disabledForegroundColor,
          borderRadius: radius ?? const BorderRadius.all(Radius.circular(80)),
          textStyle: textStyle ?? AppTextStyles.headline2,
          isOpenBoxAnimation: isOpenBoxAnimation ?? false,
          withShadow: withShadow ?? true,
          tapScale: tapScale ?? 0.92,
        );

  /// The primary icon-only button.
  const AppButton.primaryIcon({
    Widget? icon,
    Key? key,
    VoidCallback? onPressed,
    VoidCallback? onDoublePressed,
    VoidCallback? onLongPressed,
    TextStyle? textStyle,
    Color? buttonColor,
    Color? disabledButtonColor,
    EdgeInsets? padding,
  }) : this._(
          key: key,
          child: const SizedBox(),
          icon: icon,
          padding: padding ?? EdgeInsets.zero,
          maximumSize: const Size(62, 62),
          minimumSize: const Size(62, 62),
          onPressed: onPressed,
          onDoublePressed: onDoublePressed,
          onLongPressed: onLongPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor,
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          textStyle: textStyle ?? AppTextStyles.headline2,
          withShadow: true,
        );

  /// The secondary button.
  AppButton.secondary({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    EdgeInsets? padding,
    bool? withTransparentBackground,
    bool? withShadow,
    // TODO(Ashish): to create a separate button for this
    BorderRadius? borderRadius,
    Color? buttonColor,
    int? childFlex,
    double? minWidth,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
          iconPadding: iconPadding,
          minimumSize: Size(minWidth ?? 0, 42),
          maximumSize: const Size(double.infinity, 42),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(200),
              ),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
          childFlex: childFlex,
        );

  /// The community action button.
  const AppButton.communityAction({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    EdgeInsets? padding,
    bool? withTransparentBackground,
    Color? buttonColor,
    BorderRadius? radius,
    Size? maxSize,
    Size? minSize,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ?? const EdgeInsets.all(10),
          iconPadding: iconPadding,
          maximumSize: maxSize ?? const Size(double.infinity, 46),
          minimumSize: minSize ?? const Size(47, 46),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.white38,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: radius ?? const BorderRadius.all(Radius.circular(110)),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
        );

  /// The fullWidth button constructor.
  const AppButton.fullWidth({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    EdgeInsets? padding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    Color? buttonColor,
    bool? isOpenBoxAnimation,
    int? childFlex = 0,
    Alignment? childAlignment,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 18,
              ),
          iconPadding: iconPadding,
          maximumSize: const Size(double.infinity, 62),
          minimumSize: const Size(double.infinity, 62),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.white38,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          textStyle: textStyle ?? AppTextStyles.headline2,
          withTransparentBackground: withTransparentBackground ?? false,
          isOpenBoxAnimation: isOpenBoxAnimation ?? false,
          childAlignment: childAlignment ?? Alignment.center,
          childFlex: childFlex,
        );

  /// The fullWidthSmall button constructor.
  const AppButton.fullWidthSmall({
    Widget? child,
    int? childFlex,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    bool? isOpenBoxAnimation,
    BorderRadius? radius,
    EdgeInsets? padding,
    bool? withShadow,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          childFlex: childFlex,
          icon: icon,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 18,
              ),
          iconPadding: iconPadding,
          maximumSize: const Size(double.infinity, 46),
          minimumSize: const Size(double.infinity, 46),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.white38,
          disabledButtonColor: disabledButtonColor ?? AppColors.white12,
          foregroundColor: foregroundColor ?? AppColors.primaryWhite,
          disabledForegroundColor: AppColors.white38,
          borderRadius: radius ?? const BorderRadius.all(Radius.circular(80)),
          textStyle: textStyle ?? AppTextStyles.headline2,
          withTransparentBackground: withTransparentBackground ?? false,
          isOpenBoxAnimation: isOpenBoxAnimation ?? false,
          withShadow: withShadow,
        );

  /// The icon button constructor.
  const AppButton.icon({
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    bool? withTransparentBackground,
    Color? buttonColor,
  }) : this._(
          key: key,
          child: const SizedBox.shrink(),
          icon: icon,
          padding: const EdgeInsets.all(10),
          iconPadding: iconPadding,
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(56, 56),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.white38,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          textStyle: AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
        );

  /// The actionIcon button constructor.
  const AppButton.actionIcon({
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    bool? withTransparentBackground,
    Color? buttonColor,
  }) : this._(
          key: key,
          child: const SizedBox.shrink(),
          icon: icon,
          padding: EdgeInsets.zero,
          iconPadding: iconPadding,
          maximumSize: const Size(double.infinity, 30),
          minimumSize: const Size(30, 30),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.white38,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          textStyle: AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
        );

  /// The appBarCircle button constructor.
  const AppButton.appBarCircle({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    EdgeInsets? padding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    bool? withShadow,
    Color? buttonColor,
    Color? disabledButtonColor,
    Size? maximumSize,
    Size? minimumSize,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ?? EdgeInsets.zero,
          iconPadding: iconPadding,
          maximumSize: maximumSize ?? const Size(47, 42),
          minimumSize: minimumSize ?? const Size(42, 42),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.button,
          disabledForegroundColor: AppColors.button,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
        );

  /// The player control buttons constructor.
  const AppButton.playButtonControl({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    bool? withShadow,
    Color? buttonColor,
    Color? disabledButtonColor,
    Size? maximumSize,
    Size? minimumSize,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: EdgeInsets.zero,
          iconPadding: iconPadding,
          maximumSize: maximumSize ?? const Size(62, 62),
          minimumSize: minimumSize ?? const Size(62, 62),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.button,
          disabledForegroundColor: AppColors.button,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
        );

  /// The createPostAction button constructor.
  const AppButton.postAction({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    EdgeInsets? padding,
    Key? key,
    VoidCallback? onPressed,
    VoidCallback? onLongPressed,
    TextStyle? textStyle,
    Color? buttonColor,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8),
          iconPadding:
              iconPadding ?? const EdgeInsets.only(left: AppSpacing.xxs),
          maximumSize: const Size(double.infinity, 33),
          minimumSize: const Size(33, 33),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.menu,
          foregroundColor: AppColors.primaryBlack,
          disabledButtonColor: AppColors.menu,
          disabledForegroundColor: AppColors.primaryBlack,
          borderRadius: const BorderRadius.all(Radius.circular(110)),
          textStyle: textStyle ?? AppTextStyles.callout,
          onLongPressed: onLongPressed,
        );

  /// The bottomAnimatedAction button constructor.
  const AppButton.fixedBottomAction({
    Widget? child,
    Widget? icon,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    EdgeInsets? padding,
    bool? withTransparentBackground,
    Color? buttonColor,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
          iconPadding: EdgeInsets.zero,
          minimumSize: const Size(217, 62),
          maximumSize: const Size(217, 62),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
        );

  /// The AppBar buttons constructor.
  const AppButton.appBar({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    EdgeInsets? padding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    Color? buttonColor,
    Color? foregroundColor,
    Color? disabledButtonColor,
    bool? withShadow,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
          maximumSize: const Size(double.infinity, 42),
          minimumSize: const Size(0, 30),
          iconPadding: iconPadding,
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: foregroundColor ?? AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(
            Radius.circular(200),
          ),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
        );

  /// The AppBar buttons constructor.
  const AppButton.small({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    Color? buttonColor,
    Color? disabledButtonColor,
    bool? withShadow,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          maximumSize: Size.infinite,
          minimumSize: const Size(0, 30),
          iconPadding: iconPadding,
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(46)),
          textStyle: textStyle ?? AppTextStyles.caption,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
        );

  /// The text button constructor.
  const AppButton.text({
    Widget? child,
    int? childFlex,
    Widget? icon,
    EdgeInsets? iconPadding,
    EdgeInsets? padding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    Color? buttonColor,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          childFlex: childFlex,
          icon: icon,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.smd,
              ),
          maximumSize: const Size(
            double.infinity,
            AppSpacing.xxmlg,
          ),
          minimumSize: const Size(
            AppSpacing.xxlg,
            AppSpacing.xxmlg,
          ),
          iconPadding: iconPadding,
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSpacing.xxlg),
          ),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
        );

  /// The sized button with min and max size.
  const AppButton.sized({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    EdgeInsets? padding,
    bool? withTransparentBackground,
    bool? withShadow,
    // TODO(Ashish): to create a separate button for this
    BorderRadius? borderRadius,
    Color? buttonColor,
    Size? minSize,
    Size? maxSize,
    CrossAxisAlignment? crossAxisAlignment,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: padding ?? const EdgeInsets.all(AppSpacing.md),
          iconPadding: iconPadding,
          minimumSize: minSize ?? const Size(0, 45),
          maximumSize: maxSize ?? const Size(double.infinity, 45),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.black4,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(AppSpacing.spacing62),
              ),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
          crossAxisAlignment: crossAxisAlignment,
        );

  /// The details tab button used on details pages (community/user details).
  const AppButton.detailsTab({
    required bool isSelected,
    Widget? child,
    Key? key,
    VoidCallback? onPressed,
    Widget? icon,
    EdgeInsets? padding,
    Size? maximumSize,
    Size? minimumSize,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          iconPadding: icon != null ? const EdgeInsets.only(right: 4) : null,
          padding: padding ?? const EdgeInsets.all(10),
          minimumSize: minimumSize ?? const Size(42, 42),
          maximumSize: maximumSize ?? const Size(double.infinity, 42),
          onPressed: onPressed,
          buttonColor: isSelected ? AppColors.primaryWhite : AppColors.button,
          foregroundColor:
              isSelected ? AppColors.primaryBlack : AppColors.primaryWhite,
          disabledButtonColor: AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          textStyle: AppTextStyles.bodyText1,
        );

  /// The detail footer full-width button.
  const AppButton.detailFooterFullWidth({
    Widget? child,
    Key? key,
    EdgeInsets? padding,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    Size? minimumSize,
    Size? maximumSize,
    BorderRadius? borderRadius,
    int? childFlex,
    bool? showLoader,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          minimumSize: minimumSize ??
              const Size(
                double.infinity,
                46,
              ),
          maximumSize: maximumSize ??
              const Size(
                double.infinity,
                46,
              ),
          childFlex: childFlex,
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.primaryWhite,
          foregroundColor: foregroundColor ?? AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.white12,
          disabledForegroundColor: disabledForegroundColor ?? AppColors.white38,
          padding: padding ?? EdgeInsets.zero,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          textStyle: textStyle,
          showLoader: showLoader ?? false,
        );

  /// The overview full-width button.
  const AppButton.overviewFullWidth({
    Widget? child,
    Key? key,
    EdgeInsets? padding,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    Size? minimumSize,
    Size? maximumSize,
    BorderRadius? borderRadius,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          minimumSize: minimumSize ??
              const Size(
                double.infinity,
                40,
              ),
          maximumSize: maximumSize ??
              const Size(
                double.infinity,
                40,
              ),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.white4,
          foregroundColor: foregroundColor ?? AppColors.white4,
          disabledButtonColor: disabledButtonColor ?? AppColors.white4,
          disabledForegroundColor: disabledForegroundColor ?? AppColors.white4,
          padding: padding ?? EdgeInsets.zero,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(200)),
          textStyle: textStyle,
        );

  /// The small text button.
  const AppButton.smallText({
    Widget? child,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    Color? buttonColor,
    Color? disabledButtonColor,
    bool? withShadow,
    Widget? icon,
    int? childFlex,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          icon: icon,
          minimumSize: const Size(42, 26),
          maximumSize: const Size(double.infinity, 26),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.textBackground,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.white12,
          disabledForegroundColor: AppColors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(46)),
          textStyle: textStyle ?? AppTextStyles.caption,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
          childFlex: childFlex,
        );

  /// The circularAction button constructor.
  const AppButton.circularAction({
    Widget? child,
    Widget? icon,
    EdgeInsets? iconPadding,
    Key? key,
    VoidCallback? onPressed,
    TextStyle? textStyle,
    bool? withTransparentBackground,
    bool? withShadow,
    Color? buttonColor,
    Color? disabledButtonColor,
  }) : this._(
          key: key,
          child: child ?? const SizedBox(),
          icon: icon,
          padding: EdgeInsets.zero,
          iconPadding: iconPadding,
          maximumSize: const Size(46, 46),
          minimumSize: const Size(46, 46),
          onPressed: onPressed,
          buttonColor: buttonColor ?? AppColors.button,
          foregroundColor: AppColors.primaryWhite,
          disabledButtonColor: disabledButtonColor ?? AppColors.button,
          disabledForegroundColor: AppColors.button,
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          textStyle: textStyle ?? AppTextStyles.bodyText1,
          withTransparentBackground: withTransparentBackground ?? false,
          withShadow: withShadow ?? false,
        );

  /// The [VoidCallback] called when this button is pressed.
  ///
  /// The button is disabled when [onPressed] is null.
  final VoidCallback? onPressed;

  /// The [double] value for the tap scale.
  ///
  /// Defaults to `0.92`.
  final double tapScale;

  /// The [VoidCallback] called when this button is double pressed.
  final VoidCallback? onDoublePressed;

  /// The [VoidCallback] called when this button is long pressed.
  final VoidCallback? onLongPressed;

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

  /// The [TextStyle] of this button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? textStyle;

  /// The maximum size of this button.
  final Size maximumSize;

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
  final Widget child;

  /// The icon [Widget] displayed on the button.
  final Widget? icon;

  /// The padding between the icon and the text.
  final EdgeInsets? iconPadding;

  /// Whether this button has an open box animation.
  final bool isOpenBoxAnimation;

  /// Whether this button has a bottom shadow.
  final bool withShadow;

  /// [CrossAxisAlignment] for the [Row] widget.
  final CrossAxisAlignment crossAxisAlignment;

  /// The optional flex value of the child.
  ///
  /// Flex of `1` can be used to expand the child
  /// to the full width of the button.
  ///
  /// Defaults to `0` if not provided.
  final int childFlex;

  static const _transitionAnimationDuration = Duration(milliseconds: 350);

  /// The child alignment.
  final Alignment childAlignment;

  /// Whether to show the loader on the button.
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    return ScaleOnTapView(
      isScaleOnTapEnabled: onPressed != null || isOpenBoxAnimation,
      tapScale: tapScale,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onDoubleTap: onDoublePressed,
          onLongPress: onLongPressed != null
              ? () {
                  onLongPressed?.call();
                  HapticFeedback.mediumImpact();
                }
              : null,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maximumSize.width,
              minWidth: minimumSize.width,
              maxHeight: maximumSize.height,
              minHeight: minimumSize.height,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  if (withShadow)
                    BoxShadow(
                      color: AppColors.primaryBlack.withOpacity(0.32),
                      blurRadius: 18,
                      offset: const Offset(0, 8), // Shadow position
                    ),
                ],
              ),
              child: ElevatedButton(
                onPressed: onPressed != null
                    ? () {
                        /// Prevent multiple taps while button is loading.
                        if (showLoader) {
                          return;
                        }

                        onPressed?.call();
                        HapticFeedback.lightImpact();
                      }
                    : null,
                style: ButtonStyle(
                  // Allow the button to be smaller than 48x48.
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  maximumSize: MaterialStateProperty.all(maximumSize),
                  minimumSize: MaterialStateProperty.all(minimumSize),
                  padding: MaterialStateProperty.all(padding),
                  textStyle: MaterialStateProperty.all(
                    textStyle ?? Theme.of(context).textTheme.labelLarge,
                  ),
                  backgroundColor: withTransparentBackground
                      ? MaterialStateProperty.all(Colors.transparent)
                      : (onPressed == null && !isOpenBoxAnimation
                          ? MaterialStateProperty.all(disabledButtonColor)
                          : MaterialStateProperty.all(buttonColor)),
                  elevation: MaterialStateProperty.all(0),
                  foregroundColor: onPressed == null && !isOpenBoxAnimation
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    /// This is to keep the [_IconTextContent] centered
                    /// when the [showLoader] is true.
                    if (showLoader) const _EmptyViewOfLoaderSize(),
                    Flexible(
                      flex: childFlex,
                      child: _IconTextContent(
                        childFlex: childFlex,
                        crossAxisAlignment: crossAxisAlignment,
                        transitionAnimationDuration:
                            _transitionAnimationDuration,
                        icon: icon,
                        iconPadding: iconPadding,
                        childAlignment: childAlignment,
                        child: child,
                      ),
                    ),
                    if (showLoader) const _Loader(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconTextContent extends StatelessWidget {
  const _IconTextContent({
    required this.childFlex,
    required this.transitionAnimationDuration,
    required this.child,
    required this.childAlignment,
    required this.crossAxisAlignment,
    this.icon,
    this.iconPadding,
  });

  final int childFlex;
  final Duration transitionAnimationDuration;
  final Widget child;
  final Widget? icon;
  final EdgeInsets? iconPadding;
  final Alignment childAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        AppAnimatedSwitcher(
          duration: transitionAnimationDuration,
          child: icon ?? const SizedBox(),
        ),
        Flexible(
          flex: childFlex,
          child: AppAnimatedSwitcher(
            duration: transitionAnimationDuration,
            transitionBuilder: (Widget child, Animation<double> animation) {
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
            child: Container(
              key: Key('${child.key}_container'),
              alignment: childAlignment,
              child: Padding(
                padding: iconPadding ??
                    (icon != null && child is! SizedBox
                        ? const EdgeInsets.only(left: AppSpacing.xs)
                        : EdgeInsets.zero),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: LoadingWidget(
        type: LoadingType.orb,
        width: LoadingWidget.defaultOrbLoaderSize.width,
        height: LoadingWidget.defaultOrbLoaderSize.height,
        useWhiteLogo: false,
      ),
    );
  }
}

class _EmptyViewOfLoaderSize extends StatelessWidget {
  const _EmptyViewOfLoaderSize();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox.fromSize(
        size: LoadingWidget.defaultOrbLoaderSize,
      ),
    );
  }
}
