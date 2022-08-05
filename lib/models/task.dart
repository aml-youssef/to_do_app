import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Reminder {
  dayBefore,
  r1hourBefore,
  r30minBefore,
  r10minBefore,
}

enum FilterType {
  all,
  completed,
  uncompleted,
  favorite,
}

const String tasksTableName = 'tasks';

class TaskFields {
  static const String id = '_id';
  static const String title = 'title';
  static const String date = 'date';
  static const String startTime = 'startTime';
  static const String endTime = 'endTime';
  static const String reminder = 'reminder';
  static const String isComplete = 'isComplete';
  static const String isFavorite = 'isFavorite';

  static List<String> values() {
    return [
      id,
      title,
      date,
      startTime,
      endTime,
      reminder,
      isComplete,
      isFavorite,
    ];
  }
}

class Task {
  final int? id;
  final String title;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Reminder reminder;
  bool isComplete;
  bool isFavorite;

  Task({
    this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.reminder,
    required this.title,
    this.isComplete = false,
    this.isFavorite = false,
  });

  static String timeOfDayToString(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  static TimeOfDay stringToTimeOfDay(String input) {
    TimeOfDay day;
    final format = DateFormat.jm(); //"6:00 AM"
    day = TimeOfDay.fromDateTime(format.parse(input));
    return day;
  }

  static DateTime stringToDateTime(String input) {
    // DateFormat inputFormat = DateFormat('yyy - MM - dd');
    return DateTime.parse(input);
  }

  static Reminder mapToReminder(String reminder) {
    if (reminder == 'Reminder.dayBefore' || reminder == "day before") {
      return Reminder.dayBefore;
    } else if (reminder == 'Reminder.r1hourBefore' ||
        reminder == "1 hour before") {
      return Reminder.r1hourBefore;
    } else if (reminder == 'Reminder.r30minBefore' ||
        reminder == "30 minutes before") {
      return Reminder.r30minBefore;
    } else if (reminder == 'Reminder.r10minBefore' ||
        reminder == "10 minutes before") {
      return Reminder.r10minBefore;
    } else {
      throw Exception('3o3o3o3o3oo3o3o3o3oo3 can\'t map this string');
    }
  }

  static Task fromMap(Map<String, Object?> task) {
    return Task(
      id: task[TaskFields.id] as int, // as String,
      date: DateTime.parse(task[TaskFields.date] as String),
      startTime: stringToTimeOfDay(task[TaskFields.startTime] as String),
      endTime: stringToTimeOfDay(task[TaskFields.endTime] as String),
      reminder: mapToReminder(task[TaskFields.reminder] as String),
      title: task[TaskFields.title] as String,
      isComplete: task[TaskFields.isComplete] == 1,
      isFavorite: task[TaskFields.isFavorite] == 1,
    );
  }

  Map<String, Object?> toMap() {
    return {
      TaskFields.id: id,
      TaskFields.title: title,
      TaskFields.date: date.toIso8601String(),
      TaskFields.startTime: timeOfDayToString(startTime),
      TaskFields.endTime: timeOfDayToString(endTime),
      TaskFields.reminder: reminder.toString(),
      TaskFields.isComplete: isComplete ? 1 : 0,
      TaskFields.isFavorite: isFavorite ? 1 : 0,
    };
  }

  Task copyWith({
    int? id,
    String? title,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    Reminder? reminder,
    bool? isComplete,
    bool? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      reminder: reminder ?? this.reminder,
      title: title ?? this.title,
      isComplete: isComplete ?? this.isComplete,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  bool isSameDate(DateTime other) {
    return this.date.year == other.year &&
        this.date.month == other.month &&
        this.date.day == other.day;
  }
}
