// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('AppButton', () {
    testWidgets('renders buttons', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        Column(
          children: [
            AppButton.primary(
              child: buttonText,
            ),
            AppButton.secondary(
              child: buttonText,
            ),
          ],
        ),
      );
      expect(find.byType(AppButton), findsNWidgets(2));
      expect(find.text('buttonText'), findsNWidgets(2));
    });
  });
}
