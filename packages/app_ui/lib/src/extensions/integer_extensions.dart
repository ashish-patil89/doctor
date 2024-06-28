/// Integer extensions.
extension IntegerExtension on int {
  /// Returns `this` days from now in milliseconds.
  int get daysFromNowInMilliseconds {
    return DateTime.now().add(Duration(days: this)).millisecondsSinceEpoch;
  }

  /// Returns `this` as a trimmed number.
  /// eg: Will return this or 99 for any number greater than 99.
  String getTrimmedNumber() {
    if (this > 99) {
      return '99';
    }
    return toString();
  }
}
