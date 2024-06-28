/// Duration extensions.
extension DurationExtension on Duration {
  /// Converts a Duration to a m:s format.
  String formatMinutesSeconds({bool isPadded = true}) {
    if (isPadded) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
      final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
    String twoDigits(int n) => n.toString().padLeft(1, '0');
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  /// Returns the remaining time from this duration to [toDuration].
  String remainingTime({
    required Duration toDuration,
    bool isPadded = false,
  }) {
    final remaining = this - toDuration;
    return '-${remaining.formatMinutesSeconds(
      isPadded: isPadded,
    )}';
  }
}
