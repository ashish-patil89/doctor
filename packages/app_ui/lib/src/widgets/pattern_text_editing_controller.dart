import 'package:flutter/material.dart';

/// {@template pattern_text_editing_controller}
/// The pattern text editing controller.
/// {@endtemplate}
class PatternTextEditingController extends TextEditingController {
  /// {@macro pattern_text_editing_controller}
  PatternTextEditingController(this.map)
      : pattern = RegExp(
          map.keys.map((key) {
            return key;
          }).join('|'),
          multiLine: true,
        );

  /// Map of text with their respective styles.
  final Map<String, TextStyle> map;

  /// The pattern to match.
  final Pattern pattern;

  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
      composing: TextRange.empty,
    );
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    bool? withComposing,
  }) {
    final children = <InlineSpan>[];
    var patternMatched = '';
    String? formatText = '';
    TextStyle? myStyle;
    text.splitMapJoin(
      pattern,
      onMatch: (Match match) {
        myStyle = map[match[0]] ??
            map[map.keys.firstWhere(
              (e) {
                var ret = false;
                RegExp(e).allMatches(text).forEach((element) {
                  if (element.group(0) == match[0]) {
                    patternMatched = e;
                    ret = true;
                  }
                });
                return ret;
              },
            )];

        if (patternMatched == r'_(.*?)\_') {
          formatText = match[0]?.replaceAll('_', ' ');
        } else if (patternMatched == r'\*\*(.*?(\n.*)*)\*\*') {
          formatText = match[0]?.replaceAll('**', '  ');
        } else if (patternMatched == '~(.*?)~') {
          formatText = match[0]?.replaceAll('~', ' ');
        } else if (patternMatched == '```(.*?)```') {
          formatText = match[0]?.replaceAll('```', '   ');
        } else {
          formatText = match[0];
        }
        children.add(
          TextSpan(
            text: formatText,
            style: style?.merge(myStyle),
          ),
        );
        return '';
      },
      onNonMatch: (String text) {
        children.add(TextSpan(text: text, style: style));
        return '';
      },
    );

    return TextSpan(style: style, children: children);
  }
}
