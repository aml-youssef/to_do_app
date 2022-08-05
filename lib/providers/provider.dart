import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tasks.dart';
import '../models/task.dart';

final tasksProvider = StateNotifierProvider<Tasks, List<Task>>((ref) {
  return Tasks(ref.read);
});

final filterTypeProvider =
    StateProvider.family<FilterType, FilterType>((ref, type) => type);

final filteredTodoListProvider =
    FutureProvider.family<List<Task>, FilterType>((ref, type) async {
  FilterType filter = ref.watch(filterTypeProvider(type));
  final List<Task> tasks = await ref.watch(tasksProvider);
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
    FutureProvider.family<List<Task>, DateTime>((ref, date) async {
  DateTime filter = ref.watch(filterWeekDaysProvider(date));
  final List<Task> tasks = await ref.watch(tasksProvider);
  return tasks.where((element) => element.isSameDate(filter)).toList();
});
