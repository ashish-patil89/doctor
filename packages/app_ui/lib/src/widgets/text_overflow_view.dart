import 'package:flutter/material.dart';

/// {@template text_overflow_view}
/// A widget that checks if a `Text` widget overflows and
/// displays `child` or `childOnTextOverflown` accordingly.
/// {@endtemplate}
class TextOverflowView extends StatelessWidget {
  /// {@macro text_overflow_view}
  const TextOverflowView({
    required this.childOnTextOverflown,
    required this.child,
    super.key,
    this.maxLines = 1,
  });

  /// [Text] widget to show if the text doesn't overflow.
  ///
  /// If [Text.textSpan] is not null,
  /// it will be used to check the overflow.
  /// Otherwise [Text.data] and [Text.style]
  /// will be used.
  final Text child;

  /// [Widget] to show if the text overflows.
  final Widget childOnTextOverflown;

  /// Number of lines when the text should overflow.
  ///
  /// Defaults to `1`.
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final textSpanToCheck =
        child.textSpan ?? TextSpan(text: child.data, style: child.style);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTextOverflowed = _isTextOverflowed(
          textSpanToCheck,
          maxWidth: constraints.maxWidth,
          maxLines: maxLines,
        );

        return isTextOverflowed ? childOnTextOverflown : child;
      },
    );
  }

  bool _isTextOverflowed(
    InlineSpan textSpan, {
    double minWidth = 0,
    double maxWidth = double.infinity,
    int maxLines = 1,
  }) {
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );

    // ignore: cascade_invocations
    textPainter.layout(
      minWidth: minWidth,
      maxWidth: maxWidth,
    );

    return textPainter.didExceedMaxLines;
  }
}
