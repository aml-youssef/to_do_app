import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tasks.dart';
import '../models/task.dart';

enum FilterType {
  all,
  completed,
  uncompleted,
  favorite,
}

final tasksProvider = StateNotifierProvider<Tasks, List<Task>>((ref) {
  return Tasks();
});

final filterTypeProvider =
    StateProvider.family<FilterType, FilterType>((ref, type) => type);

final filteredTodoListProvider =
    Provider.family<List<Task>, FilterType>((ref, type) {
  final FilterType filter = ref.watch(filterTypeProvider(type));
  final List<Task> tasks = ref.watch(tasksProvider);
  switch (filter) {
    case FilterType.completed:
      return tasks.where((task) => task.isComplete).toList();
    case FilterType.uncompleted:
      return tasks.where((task) => !task.isComplete).toList();
    case FilterType.favorite:
      return tasks.where((task) => task.isFavorite).toList();
    case FilterType.all:
      return tasks;
  }
});

final filterWeekDaysProvider =
    StateProvider.family<DateTime, DateTime>((ref, date) => date);

final filteredSchedleListProvider =
    Provider.family<List<Task>, DateTime>((ref, date) {
  final List<Task> tasks = ref.watch(tasksProvider);
  DateTime filter = ref.watch(filterWeekDaysProvider(date));
  return tasks.where((element) => element.isSameDate(filter)).toList();
});
