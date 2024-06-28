import 'package:flutter/services.dart';

/// {@template percent_range_text_input_formatter}
/// The percent range input to validate and format percentage values.
/// {@endtemplate}
class PercentRangeTextInputFormatter extends TextInputFormatter {
  /// {@macro percent_range_text_input_formatter}
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final inputText = newValue.text.isEmpty ? '0' : newValue.text;
    final enteredValue = int.tryParse(inputText) ?? 0;

    if (enteredValue >= 0 && enteredValue <= 100) {
      return newValue;
    }

    return oldValue;
  }
}
