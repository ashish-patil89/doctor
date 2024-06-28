import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:intl/intl.dart';

/// Extensions on [num].
extension NumExtension on num {
  /// Returns `this` number formatted with thousands separator and
  /// without trailing zeros (based on the given [localeName] or
  /// the current locale if not provided).
  ///
  /// If [showCompact] is `true` and `this` is greater than or equal to `10000`,
  /// the number will be formatted using the compact format (e.g. `10K` for
  /// thousands or `10M` for millions). If formatting as compact and
  /// [roundUp] is `true`, the number will be rounded up automatically,
  /// e.g. `99999` will be formatted as `100K`. Otherwise, `99999` will be
  /// formatted as `99.99K`.
  String formatWithThousandsSeparator({
    int? fractionalDigits,
    // Currently defaulting to `en_US` as the locale.
    String? localeName = 'en_US',
    bool roundUp = false,
    bool showCompact = true,
  }) {
    final locale = localeName ?? Platform.localeName;
    final verifiedLocale = Intl.verifiedLocale(
      locale,
      NumberFormat.localeExists,
      onFailure: (locale) => 'en_US',
    );

    if (showCompact && this >= 10000) {
      return compactFormat(
        localeName: localeName,
        roundUp: roundUp,
      );
    }

    final decimalIndex = toString().indexOf('.');
    final currentFractionalDigits =
        decimalIndex == -1 ? 0 : toString().length - decimalIndex - 1;

    // Use [fractionalDigits] if provided, otherwise
    // use the current number of fractional digits.
    final verifiedFractionalDigits =
        fractionalDigits ?? currentFractionalDigits;

    final formatter = NumberFormat.decimalPatternDigits(
      locale: verifiedLocale,
      decimalDigits: verifiedFractionalDigits,
    )
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = verifiedFractionalDigits;

    return formatter.format(this);
  }

  /// Returns `this` number in the compact format (e.g. `10K` for thousands
  /// or `10M` for millions).
  ///
  /// The compact format uses 2 fractional digits at most.
  ///
  /// If [roundUp] is `true`, the number will be rounded up automatically,
  /// e.g. `99999` will be formatted as `100K`. Otherwise, `99999` will be
  /// formatted as `99.99K`.
  String compactFormat({
    // Currently defaulting to `en_US` as the locale.
    String? localeName = 'en_US',
    bool roundUp = false,
  }) {
    // Using 2 fractional digits at most for the compact format.
    const compactNumberFractionalDigits = 2;

    final locale = localeName ?? Platform.localeName;
    final verifiedLocale = Intl.verifiedLocale(
      locale,
      NumberFormat.localeExists,
      onFailure: (locale) => 'en_US',
    );

    if (roundUp) {
      // Formatting with [NumberFormat] will automatically round up,
      // e.g. `99999` will be formatted as `100K`.
      final compactFormatter = NumberFormat.compactCurrency(
        locale: verifiedLocale,
        symbol: '',
        decimalDigits: compactNumberFractionalDigits,
      )
        ..minimumFractionDigits = 0
        ..maximumFractionDigits = compactNumberFractionalDigits;
      return compactFormatter.format(this);
    }

    // Otherwise, format the number manually (without rounding up),
    // e.g. `99999` will be formatted as `99.99K`.
    late double compactNumber;
    late String compactNumberSuffix;

    if (this < 1000) {
      compactNumber = toDouble();
    } else if (this >= 1000 && this < 1000000) {
      compactNumber = this / 1000;
      compactNumberSuffix = 'K';
    } else if (this >= 1000000 && this < 1000000000) {
      compactNumber = this / 1000000;
      compactNumberSuffix = 'M';
    } else if (this >= 1000000000 && this < 1000000000000) {
      compactNumber = this / 1000000000;
      compactNumberSuffix = 'B';
    } else {
      compactNumber = this / 1000000000000;
      compactNumberSuffix = 'T';
    }

    final compactNumberFormatted = compactNumber.truncateToDecimalPlaces(
      compactNumberFractionalDigits,
      localeName: locale,
      showCompact: false,
      // ignore: avoid_redundant_argument_values
      roundUp: false,
    );

    return '$compactNumberFormatted$compactNumberSuffix';
  }
}
