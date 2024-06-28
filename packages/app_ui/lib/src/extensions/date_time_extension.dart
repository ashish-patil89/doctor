import 'package:intl/intl.dart';

/// Extensions for [DateTime].
extension DateTimeExtension on DateTime? {
  /// Formats a date time string in times ago format.
  String get timeAgo {
    if (this == null) return '';

    final diff = DateTime.now().difference(
      DateTime.parse(
        this!.toIso8601String(),
      ),
    );
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()} '
          '${(diff.inDays / 365).floor() == 1 ? 'year' : 'years'} ago';
    }
    if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()} '
          '${(diff.inDays / 30).floor() == 1 ? "m" : "m"} ago';
    }
    if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()} '
          '${(diff.inDays / 7).floor() == 1 ? "w" : "w"} ago';
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "day"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "h" : "h"} ago";
    }
    if (diff.inMinutes > 0) {
      return '${diff.inMinutes} '
          '${diff.inMinutes == 1 ? "mins." : "mins."} ago';
    }
    return 'just now';
  }

  /// Formats a date time string to dd-MM-yyyy format.
  String get ddMMyyyy {
    if (this == null) {
      return '';
    }
    final dtInLocal = DateTime.parse(this!.toIso8601String());
    final format = DateFormat('dd-MM-yyyy');
    return format.format(dtInLocal);
  }

  /// Formats a date time string to dd MMMM yyyy format.
  String get ddMMMMyyyy {
    if (this == null) {
      return '';
    }
    final dtInLocal = DateTime.parse(this!.toIso8601String());
    final format = DateFormat('dd MMMM yyyy');
    return format.format(dtInLocal);
  }

  /// Formats a date time string to dd MMM yyyy format.
  String get ddMMMyyyy {
    if (this == null) {
      return '';
    }
    final dtInLocal = DateTime.parse(this!.toIso8601String());
    final format = DateFormat('dd MMM yyyy');
    return format.format(dtInLocal);
  }

  /// Formats a time string to hours and minutes format.
  String get hoursMinutesSeconds {
    if (this == null) {
      return '';
    }
    final dtInLocal = DateTime.parse(this!.toIso8601String());
    final format = DateFormat('hh:mm:ss');
    return format.format(dtInLocal);
  }

  /// Return start time and end time in [hh:mm] format.
  String get hoursMinutes {
    if (this == null) {
      return '';
    }
    final dtInLocal = DateTime.parse(this!.toIso8601String());
    final format = DateFormat('hh:mm');
    return format.format(dtInLocal);
  }
}
