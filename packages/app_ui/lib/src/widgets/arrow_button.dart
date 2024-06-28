import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// {@template arrow_button}
/// An arrow button.
/// {@endtemplate}
class ArrowButton extends StatelessWidget {
  /// {@macro arrow_button}
  const ArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleButton(
      icon: Icon(
        CupertinoIcons.forward,
        color: Colors.black,
      ),
      size: 70,
      backgroundColor: Colors.white,
    );
  }
}
