import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

/// The text styles for the App UI Kit.
abstract class AppTextStyles {
  /// The Large Title 1 text style.
  static const TextStyle largeTitle1 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.bold,
    fontSize: 44,
    height: 52.51 / 44.0,
    letterSpacing: -0.5,
    fontFeatures: _fontFeatures,
  );

  /// The Headline 1 text style.
  static const TextStyle headline1 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.ssProRegularDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.bold,
    fontSize: 26,
    height: 28.64 / 24.0,
    fontFeatures: _fontFeatures,
  );

  /// The Headline 2 text style.
  static const TextStyle headline2 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 22,
    height: 26.25 / 22.0,
    letterSpacing: -0.2,
    fontFeatures: _fontFeatures,
  );

  /// The Headline 3 text style.
  static const TextStyle headline3 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.semiBold,
    fontSize: 20,
    height: 22.0 / 20.0,
    letterSpacing: -0.2,
    fontFeatures: _fontFeatures,
  );

  /// The subheadline/regular text style.
  static const TextStyle subheadline = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.regular,
    fontSize: 15,
    height: 22.0 / 20.0,
    letterSpacing: -0.4,
    fontFeatures: _fontFeatures,
  );

  /// The Body Text 1 text style.
  static const TextStyle bodyText1 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 18,
    height: 21.48 / 18.0,
    fontFeatures: _fontFeatures,
  );

  /// The Body Text 2 text style (the default).
  static const TextStyle bodyText2 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 17,
    height: 22 / 17.0,
    letterSpacing: 0.2,
    fontFeatures: _fontFeatures,
  );

  /// The Body Text 2 Bold text style.
  static const TextStyle bodyText2Bold = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.bold,
    fontSize: 17,
    height: 22 / 17.0,
    letterSpacing: 0.2,
    fontFeatures: _fontFeatures,
  );

  /// The Callout text style.
  static const TextStyle callout = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.ssProRegularDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 14,
    height: 16.71 / 14.0,
    letterSpacing: 0.2,
    fontFeatures: _fontFeatures,
  );

  /// The Callout text style.
  static const TextStyle calloutSmall = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 12,
    height: 14.32 / 12.0,
    letterSpacing: 0.4,
    fontFeatures: _fontFeatures,
  );

  /// The Callout Bold text style.
  static const TextStyle calloutBold = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.bold,
    fontSize: 14,
    height: 16.71 / 14.0,
    letterSpacing: 0.2,
    fontFeatures: _fontFeatures,
  );

  /// The Caption text style.
  static const TextStyle caption = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 12,
    height: 14.32 / 12.0,
    letterSpacing: 0.4,
    fontFeatures: _fontFeatures,
  );

  /// The Caption 2 text style.
  static const TextStyle caption2 = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.medium,
    fontSize: 10,
    height: 11.93 / 10.0,
    letterSpacing: 0.2,
    fontFeatures: _fontFeatures,
  );

  /// The title On AppUpdate text style.
  static const TextStyle titleOnAppUpdate = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.bold,
    fontSize: 82,
    height: .9,
    letterSpacing: 0.2,
    fontFeatures: _fontFeatures,
  );

  /// The title on app bar.
  static const TextStyle appBarTitle = TextStyle(
    package: 'app_ui',
    fontFamily: AppFontFamilies.sfProDisplay,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontWeight: AppFontWeights.bold,
    fontSize: 38,
    height: 42 / 38,
    letterSpacing: -0.4,
    fontFeatures: _fontFeatures,
  );

  /// The enabled font features.
  static const _fontFeatures = [
    FontFeature('ss01'),
    FontFeature('ss02'),
    FontFeature('ss03'),
    FontFeature('ss04'),
    FontFeature('ss06'),
  ];

  /// The disabled font features.
  static const disabledFontFeatures = [
    FontFeature('ss01', 0),
    FontFeature('ss02', 0),
    FontFeature('ss03', 0),
    FontFeature('ss04', 0),
    FontFeature('ss06', 0),
  ];
}
