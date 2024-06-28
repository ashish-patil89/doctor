import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Extensions used with context.
extension ContextExtension on BuildContext {
  /// Returns the width of the screen.
  double get width => MediaQuery.sizeOf(this).width;

  /// Returns the height of the screen.
  double get height => MediaQuery.sizeOf(this).height;

  /// Returns the max height available for the page.
  double get pageHeight => height - (AppConstants.appBarHeight + topPadding);

  /// Returns the topPadding of the device.
  double get topPadding => MediaQuery.paddingOf(this).top;

  /// Returns the bottomInsets of the device.
  double get bottomInset => MediaQuery.viewInsetsOf(this).bottom;

  /// Returns the bottomPadding of the device.
  double get bottomPadding => MediaQuery.paddingOf(this).bottom;
}
