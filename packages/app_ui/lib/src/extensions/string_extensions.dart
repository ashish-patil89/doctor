import 'package:flutter/material.dart';

/// String extensions.
extension StringExtension on String? {
  /// Capitalizes the first letter of a string.
  String capitalize() =>
      '${this?[0].toUpperCase() ?? ''}${this?.substring(1) ?? ''}';

  /// Converts a hex string to a [Color].
  Color fromHex() {
    if (this == null) return Colors.transparent;
    final buffer = StringBuffer();
    if (this?.length == 6 || this?.length == 7) buffer.write('ff');
    buffer.write(this?.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Removes http and https from `this` url.
  String trimUrlHeader() {
    if (this == null) return '';

    final regex = RegExp(r'https?://(?:www\.)?([^\/]+)');
    final domain = regex.firstMatch(this!)?.group(1) ?? '';

    return domain;
  }

  /// Returns a string with an ellipsis in the center.
  /// E.g. '0x7E01aa087B19f6856f08428BE2bE4ACACD4c6369' becomes
  /// '0x7E01…c6369'.
  String ellipsisCenter() {
    final s = this;
    if (s == null) return '';

    if (s.length > 20) {
      return '${s.substring(0, 6)}…${s.substring(s.length - 5, s.length)}';
    }

    return s;
  }

  /// This will truncate app bar text and add dots in the end.
  String truncateAppBarText() {
    if (this == null) return '';

    return (this!.length <= 18) ? this! : '${this!.substring(0, 18)}…';
  }

  /// Trims the address to show only the first 6 and last 4 characters.
  String trimAddress() {
    if (this == null || this!.isEmpty) return '';
    return '${this!.substring(0, 6)}'
        '...'
        '${this!.substring(this!.length - 4)}';
  }

  /// Checks whether link is valid or not.
  bool hasValidUrl() {
    if (this == null || this!.isEmpty) return false;
    const pattern =
        r'[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    final regExp = RegExp(pattern);
    if (this!.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(this!)) {
      return false;
    }
    return true;
  }

  /// Checks whether instagram link is valid or not.
  bool isValidInstagramUrl() {
    // Checking for some base validation.
    // TODO(Ashish): need to find and add valid RegExp.
    if (this == null || this!.isEmpty) return false;
    const baseUrl = 'instagram.com/';
    if (this!.isEmpty) {
      return false;
    } else if (!this!.contains(baseUrl)) {
      return false;
    }
    return true;
  }

  /// Checks whether X link is valid or not.
  bool isValidXUrl() {
    // Checking for some base validation.
    // TODO(Ashish): need to find and add valid RegExp.
    if (this == null || this!.isEmpty) return false;
    const baseUrl = 'twitter.com/';
    const xUrl = 'x.com/';
    if (this!.isEmpty) {
      return false;
    } else if (!(this!.contains(baseUrl) || this!.contains(xUrl))) {
      return false;
    }
    return true;
  }

  /// Whether the string is `null` or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
