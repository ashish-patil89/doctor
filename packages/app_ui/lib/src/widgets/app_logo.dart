import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// The size of the app logo.
enum AppLogoSize {
  /// The small app logo.
  small,

  /// The large app logo.
  large,
}

/// {@template app_logo}
/// A widget that displays the app logo.
/// {@endtemplate}
class AppLogo extends StatelessWidget {
  const AppLogo._({
    this.size,
    this.width,
    this.height,
    this.color,
    super.key,
  });

  /// {@macro app_logo}
  ///
  /// Creates a small app logo.
  const AppLogo.small({Key? key}) : this._(size: AppLogoSize.small, key: key);

  /// {@macro app_logo}
  ///
  /// Creates a large app logo.
  const AppLogo.large({Key? key}) : this._(size: AppLogoSize.large, key: key);

  /// {@macro app_logo}
  ///
  /// Creates a sized app logo with specified [width] and [height].
  const AppLogo.sized({
    required double width,
    required double height,
    Color? color,
    Key? key,
  }) : this._(width: width, height: height, color: color, key: key);

  /// The size of the app logo.
  final AppLogoSize? size;

  /// The optional width of the app logo.
  ///
  /// Defaults to `25` for [AppLogoSize.small]
  /// and `42` for [AppLogoSize.large].
  final double? width;

  /// The optional height of the app logo.
  ///
  /// Defaults to `25` for [AppLogoSize.small]
  /// and `42` for [AppLogoSize.large].
  final double? height;

  /// The optional color of the app logo.
  ///
  /// Defaults to a white color.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color;
    final colorFilter =
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null;

    switch (size) {
      case AppLogoSize.small || null:
        return Assets.icons.logoSmall.svg(
          width: width ?? 25,
          height: height ?? 25,
          colorFilter: colorFilter,
        );
      case AppLogoSize.large:
        return Assets.icons.logoLarge.svg(
          width: width ?? 42,
          height: height ?? 42,
          colorFilter: colorFilter,
        );
    }
  }
}
