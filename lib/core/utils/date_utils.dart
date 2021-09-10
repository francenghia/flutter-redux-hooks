import 'package:intl/intl.dart';

class DateUtils {
  static final DateFormat _monthAndYearFormat = DateFormat('MMMM yyyy');
  static final DateFormat _dayFormat = DateFormat('dd');
  static final DateFormat _firstDayFormat = DateFormat('dd-MMM');
  static final DateFormat _fullDayFormat = DateFormat('EEE dd-MM-yyyy');
  static final DateFormat _dayMonthYearFormat = DateFormat('dd-MM-yyyy');

  static String formatMonth(DateTime d) => _monthAndYearFormat.format(d);

  static String formatDay(DateTime d) => _dayFormat.format(d);

  static String formatFirstDay(DateTime d) => _firstDayFormat.format(d);

  static String fullDayFormat(DateTime d) => _fullDayFormat.format(d);

  static String dayMonthYearFormat(DateTime d) => _dayMonthYearFormat.format(d);

  static const List<String> weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  /// Returns a [DateTime] isFirstDayOfMonth
  ///
  /// [m] DateTime
  static bool isFirstDayOfMonth(DateTime day) {
    return isSameDay(firstDayOfMonth(day), day);
  }

  /// Returns a [DateTime] isLastDayOfMonth
  ///
  /// [m] DateTime
  static bool isLastDayOfMonth(DateTime day) {
    return isSameDay(lastDayOfMonth(day), day);
  }

  /// Returns a [DateTime] firstDayOfMonth
  ///
  /// [m] DateTime
  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  /// Returns a [DateTime] isSameDay
  ///
  /// [a] DateTime
  /// [b] DateTime
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Returns a [DateTime] previousMonth
  ///
  /// [m] DateTime
  static DateTime previousMonth(DateTime m) {
    var year = m.year;
    var month = m.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  /// Returns a [DateTime] nextMonth
  ///
  /// [m] DateTime
  static DateTime nextMonth(DateTime m) {
    var year = m.year;
    var month = m.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  /// Returns a [DateTime] previousWeek
  ///
  /// [w] DateTime
  static DateTime previousWeek(DateTime w) {
    return w.subtract(const Duration(days: 7));
  }

  /// Returns a [DateTime] nextWeek
  ///
  /// [w] DateTime
  static DateTime nextWeek(DateTime w) {
    return w.add(const Duration(days: 7));
  }

  /// Returns a [DateTime] nextDay
  ///
  /// [w] DateTime
  static DateTime nextDay(DateTime w) {
    return w.add(const Duration(days: 1));
  }

  /// Returns a [DateTime] daysInWeek
  ///
  /// [w] DateTime
  static List<DateTime> daysInWeek(DateTime week) {
    final first = _firstDayOfWeek(week);
    final last = _lastDayOfWeek(week);

    final days = daysInRange(first, last);
    return days.map((day) => DateTime(day.year, day.month, day.day)).toList();
  }

  /// Returns a [DateTime] _firstDayOfWeek
  ///
  /// [day] DateTime
  static DateTime _firstDayOfWeek(DateTime day) {
    final newDay = DateTime.utc(day.year, day.month, day.day, 12);

    final decreaseNum = newDay.weekday - 1;
    return newDay.subtract(Duration(days: decreaseNum));
  }

  /// Returns a [DateTime] _lastDayOfWeek
  ///
  /// [day] DateTime
  static DateTime _lastDayOfWeek(DateTime day) {
    final newDay = DateTime.utc(day.year, day.month, day.day, 12);

    final increaseNum = newDay.weekday - 1;
    return newDay.add(Duration(days: 7 - increaseNum));
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      final timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// Returns a [DateTime] lastDayOfMonth
  ///
  /// [month] DateTime
  static DateTime lastDayOfMonth(DateTime month) {
    final beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }
}
