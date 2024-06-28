import 'package:flutter/services.dart';

/// {@template lower_case_text_input_formatter}
/// Formats the input text to lowercase.
/// {@endtemplate}
class LowerCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
