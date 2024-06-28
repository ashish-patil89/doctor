import 'dart:math';

import 'package:app_ui/app_ui.dart';

/// Extensions on [double].
extension DoubleTruncateExtension on double {
  /// Truncates this [double] to the given number of [fractionalDigits].
  ///
  /// Returns the result formatted with thousands separator and
  /// without trailing zeros (based on the given [localeName] or
  /// the current locale if not provided).
  ///
  /// If [roundUp] is `true`, the number will be rounded up
  /// before truncating to the given number of [fractionalDigits], e.g.
  /// `40.559` truncated to 2 fractional digits will be `40.56`.
  /// Otherwise, the number will not be rounded up before truncating,
  /// e.g. `40.559` truncated to 2 fractional digits will be `40.55`.
  ///
  /// If [showCompact] is `true` and `this` is greater than or equal to `10000`,
  /// the number will be formatted using the compact format (e.g. `10K` for
  /// thousands or `10M` for millions). If formatting as compact and
  /// `roundUp` is `true`, the number will be rounded up automatically,
  /// e.g. `99999` will be formatted as `100K`. Otherwise, `99999` will be
  /// formatted as `99.99K`.
  ///
  /// Examples:
  /// - `1234.10.truncateToDecimalPlaces(2)` returns `1,234.1` for `en_US`.
  /// - `1234.10.truncateToDecimalPlaces(2)` returns `1 234,1` for `pl` or `fi`.
  /// - `1234.10.truncateToDecimalPlaces(2)` returns `1.234,1` for `de`.
  String truncateToDecimalPlaces(
    int fractionalDigits, {
    // Currently defaulting to `en_US` as the locale.
    String? localeName = 'en_US',
    bool roundUp = false,
    bool showCompact = true,
  }) {
    final numberString = toString();
    final decimalIndex = numberString.indexOf('.');

    if (decimalIndex == -1) {
      // No decimal point, so just format with the thousands separator.
      return formatWithThousandsSeparator(
        fractionalDigits: fractionalDigits,
        localeName: localeName,
        showCompact: showCompact,
        roundUp: roundUp,
      );
    } else {
      // If [roundUp] is `false`, then we need to truncate the value
      // to [fractionalDigits] decimal places before formatting to
      // avoid rounding up automatically.
      late double valueBeforeFormatting;
      if (!roundUp) {
        final truncatedString = numberString.substring(
          0,
          min(numberString.length, decimalIndex + fractionalDigits + 1),
        );

        final truncatedValue = double.parse(truncatedString);
        valueBeforeFormatting = truncatedValue;
      } else {
        valueBeforeFormatting = this;
      }

      // Then, format the truncated value with the thousands separator
      // and remove the trailing zeros.
      final formattedValue = valueBeforeFormatting.formatWithThousandsSeparator(
        fractionalDigits: fractionalDigits,
        localeName: localeName,
        roundUp: roundUp,
        showCompact: showCompact,
      );

      // If the formatted value is `0`, but the value is not 0,
      // then truncate to the first non-zero fractional digit.
      //
      // Example:
      // If [fractionalDigits] is 2 and the value is `0.00014`,
      // then the formatted value will be `0.00`. To avoid this,
      // we truncate to the first non-zero decimal place and return
      // as `0.0001`.
      if (formattedValue == '0' && this != 0) {
        return _truncateToFirstNonZeroFractionalDigit(
              localeName: localeName,
              roundUp: roundUp,
              showCompact: showCompact,
            ) ??
            formattedValue;
      }

      return formattedValue;
    }
  }

  String? _truncateToFirstNonZeroFractionalDigit({
    // Currently defaulting to `en_US` as the locale.
    String? localeName = 'en_US',
    bool roundUp = false,
    bool showCompact = true,
  }) {
    final numberString = toString();
    final decimalIndex = numberString.indexOf('.');

    final firstNonZeroFractionalDigitIndex =
        numberString.indexOf(RegExp('[1-9]'));
    if (firstNonZeroFractionalDigitIndex == -1) {
      return null;
    }

    // Find the number of fractional digits
    // from the first non-zero fractional digit.
    final fractionalDigits = firstNonZeroFractionalDigitIndex - decimalIndex;

    // If [roundUp] is `false`, then we need to truncate the value
    // to [fractionalDigits] decimal places before formatting to
    // avoid rounding up automatically.
    late double valueBeforeFormatting;
    if (!roundUp) {
      final truncatedString = numberString.substring(
        0,
        min(numberString.length, decimalIndex + fractionalDigits + 1),
      );

      final truncatedValue = double.parse(truncatedString);
      valueBeforeFormatting = truncatedValue;
    } else {
      valueBeforeFormatting = this;
    }

    return valueBeforeFormatting.formatWithThousandsSeparator(
      fractionalDigits: fractionalDigits,
      localeName: localeName,
      roundUp: roundUp,
      showCompact: showCompact,
    );
  }
}
