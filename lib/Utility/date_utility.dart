import 'dart:math';

import 'package:intl/intl.dart';

class DateUtility {
  DateTime? from;
  static const _daysInMonthArray = [
    0,
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  DateUtility([var input]) {
    from = _parse(input);
  }

  DateTime _parse(var input, [var pattern]) {
    var dateTime;
    if (input == null) {
      dateTime = DateTime.now();
    } else if (isDateTime(input)) {
      dateTime = input;
    } else if (input is Map) {
      dateTime = _parseMap(input);
    } else if (input is List) {
      dateTime = _parseList(input);
    } else if (input is String) {
      dateTime = _parseString(input, pattern);
    } else {
      throw Exception(
          'DateUtility only accepts List, Map, String or DateTime as parameters');
    }
    return dateTime;
  }

  bool _isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  bool isDateTime(var input) => input is DateTime;

  int _daysInMonth(int year, int month) {
    var result = _daysInMonthArray[month];
    if (month == 2 && _isLeapYear(year)) result++;
    return result;
  }

  DateTime addMonths(DateTime from, int months) {
    final r = months % 12;
    final q = (months - r) ~/ 12;
    var newYear = from.year + q;
    var newMonth = from.month + r;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    final newDay = min(from.day, _daysInMonth(newYear, newMonth));
    if (from.isUtc) {
      return DateTime.utc(newYear, newMonth, newDay, from.hour, from.minute,
          from.second, from.millisecond, from.microsecond);
    } else {
      return DateTime(newYear, newMonth, newDay, from.hour, from.minute,
          from.second, from.millisecond, from.microsecond);
    }
  }

  DateTime add({
    required DateTime from,
    int years = 0,
    int months = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) {
    DateTime given = from.add(Duration(
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        milliseconds: milliseconds,
        microseconds: microseconds));
    given = addMonths(given, (months + (years * 12)));
    return given;
  }

  DateTime _parseMap(Map input) {
    if (input.isEmpty) {
      return DateTime.now();
    } else {
      return DateTime(
          input['year'] ?? input['years'] ?? input['y'] ?? DateTime.now().year,
          input['month'] ??
              input['months'] ??
              input['M'] ??
              DateTime.now().month,
          input['day'] ?? input['days'] ?? input['d'] ?? DateTime.now().day,
          input['hour'] ?? input['hours'] ?? input['h'] ?? DateTime.now().hour,
          input['minute'] ??
              input['minutes'] ??
              input['m'] ??
              DateTime.now().minute,
          input['second'] ??
              input['seconds'] ??
              input['s'] ??
              DateTime.now().second,
          input['millisecond'] ??
              input['milliseconds'] ??
              input['ms'] ??
              DateTime.now().millisecond);
    }
  }

  DateTime _parseList(List input) {
    if (input.isEmpty) {
      return DateTime.now();
    } else {
      return DateTime(
          input[0],
          input.length > 1 ? input[1] : 1,
          input.length > 2 ? input[2] : 1,
          input.length > 3 ? input[3] : 0,
          input.length > 4 ? input[4] : 0,
          input.length > 5 ? input[5] : 0,
          input.length > 6 ? input[6] : 0);
    }
  }

  DateTime _parseString(String input, String? pattern) {
    if (pattern != null) {
      return DateFormat(replacePatternInput(pattern))
          .parse(replaceParseInput(input));
    } else if (matchHyphenStringDateTime(input)) {
      return DateFormat('yyyy-MM-dd',"en_us").parse(input);
    } else if (matchDartStringDateTime(input) ||
        matchISOStringDateTime(input)) {
      return DateTime.parse(input).toLocal();
    } else if (matchSlashStringDateTime(input)) {
      return DateFormat('yyyy/MM/dd').parse(input);
    } else if (matchBasicStringDateTime().hasMatch(input)) {
      return DateFormat('yyyy/MM/dd')
          .parse(input.replaceAllMapped(matchBasicStringDateTime(), (match) {
        return '${match.group(1)}/${match.group(2)}/${match.group(3)}';
      }));
    } else {
      throw Exception(
          'Date time not recognized, a pattern must be passed, e.g. DateUtility("12, Oct", "dd, MMM")');
    }
  }

  String replacePatternInput(String input) {
    return input.replaceFirst('do', 'd');
  }

  String replaceParseInput(String input) {
    return input
        .replaceFirst(' pm', ' PM')
        .replaceFirst(' am', ' AM')
        .replaceFirst(matchOrdinalDates(), '');
  }

  Pattern matchOrdinalDates() {
    return RegExp(r'(?<=[0-9])(?:st|nd|rd|th)');
  }

  bool matchHyphenStringDateTime(String input) {
    return RegExp(r'\d{4}-\d{1,2}-\d{1,2}$').hasMatch(input);
  }

  bool matchDartStringDateTime(String input) {
    return RegExp(
            r'\d{4}-\d{1,2}-\d{1,2} \d{1,2}(:\d{1,2})?(:\d{1,2})?(.\d+)?(Z?)')
        .hasMatch(input);
  }

  bool matchISOStringDateTime(String input) {
    return RegExp(
            r'\d{4}-\d{1,2}-\d{1,2}T\d{1,2}(:\d{1,2})?(:\d{1,2})?(.\d+)?(Z?)')
        .hasMatch(input);
  }

  bool matchSlashStringDateTime(String input) {
    return RegExp(r'\d{4}\/\d{1,2}\/\d{1,2}$').hasMatch(input);
  }

  RegExp matchBasicStringDateTime() {
    return RegExp(r'(\d{4})(\d{1,2})(\d{1,2})$');
  }
}
