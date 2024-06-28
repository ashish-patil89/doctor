import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_theme}
/// The default app [ThemeData] for App UI Kit.
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// The default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.primaryBlack,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      scrollbarTheme: _scrollbarTheme,
      listTileTheme: _listTileTheme,
      dividerTheme: _dividerTheme,
      buttonTheme: _buttonTheme,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      snackBarTheme: _snackBarTheme,
      colorScheme: _colorScheme.copyWith(background: _backgroundColor),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.blue,
        selectionColor: AppColors.primaryOrangeLight,
        selectionHandleColor: AppColors.primaryGreen,
      ),
      sliderTheme: _sliderTheme,
    );
  }

  ColorScheme get _colorScheme {
    return const ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.menu,
    );
  }

  Color get _backgroundColor => AppColors.backgroundPrimary;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      titleTextStyle: _textTheme.titleLarge,
      elevation: 0,
      backgroundColor: AppColors.backgroundPrimary,
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.primaryWhite,
    );
  }

  TextTheme get _textTheme {
    return const TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      displaySmall: AppTextStyles.headline3,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      labelLarge: AppTextStyles.callout,
      bodySmall: AppTextStyles.caption,
      labelSmall: AppTextStyles.caption2,
    ).apply(
      bodyColor: AppColors.primaryWhite,
      displayColor: AppColors.primaryWhite,
      decorationColor: AppColors.primaryWhite,
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.black38),
    );
  }

  ScrollbarThemeData get _scrollbarTheme {
    return ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.white60),
      trackColor: MaterialStateProperty.all(AppColors.white12),
    );
  }

  ListTileThemeData get _listTileTheme {
    return ListTileThemeData(
      textColor: AppColors.primaryWhite,
      titleTextStyle: AppTextStyles.bodyText2.copyWith(
        fontWeight: AppFontWeights.bold,
      ),
      subtitleTextStyle: AppTextStyles.bodyText2,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.white38,
      space: AppSpacing.xlg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.xlg,
      endIndent: AppSpacing.xlg,
    );
  }

  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      minWidth: 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: AppTextStyles.bodyText1.copyWith(
        color: AppColors.primaryWhite,
      ),
      shape: const RoundedRectangleBorder(),
      backgroundColor: AppColors.primaryBlack,
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
    );
  }

  SliderThemeData get _sliderTheme {
    return const SliderThemeData(
      trackHeight: 1,
    );
  }
}
