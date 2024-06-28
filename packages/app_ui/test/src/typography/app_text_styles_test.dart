import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyles', () {
    test('largeTitle1 returns TextStyle', () {
      expect(AppTextStyles.largeTitle1, isA<TextStyle>());
    });

    test('headline1 returns TextStyle', () {
      expect(AppTextStyles.headline1, isA<TextStyle>());
    });

    test('headline2 returns TextStyle', () {
      expect(AppTextStyles.headline2, isA<TextStyle>());
    });

    test('headline3 returns TextStyle', () {
      expect(AppTextStyles.headline3, isA<TextStyle>());
    });

    test('bodyText1 returns TextStyle', () {
      expect(AppTextStyles.bodyText1, isA<TextStyle>());
    });

    test('bodyText2 returns TextStyle', () {
      expect(AppTextStyles.bodyText2, isA<TextStyle>());
    });

    test('callout returns TextStyle', () {
      expect(AppTextStyles.callout, isA<TextStyle>());
    });

    test('caption returns TextStyle', () {
      expect(AppTextStyles.caption, isA<TextStyle>());
    });

    test('caption2 returns TextStyle', () {
      expect(AppTextStyles.caption2, isA<TextStyle>());
    });
  });
}
