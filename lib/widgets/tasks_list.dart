import 'package:flutter/material.dart';
import 'task_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/provider.dart';

class TaskList extends ConsumerWidget {
  final FilterType type;
  const TaskList(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AsyncValue<List<Task>> tasks = ref.watch(filteredTodoListProvider(type));

    return tasks.when(
      data: (data) => data.isEmpty
          ? const Center(
              child: Text('no taskes yet'),
            )
          : ListView.builder(
              itemBuilder: (cxt, i) => TaskItem(
                task: data[i],
              ),
              itemCount: data.length,
            ),
      error: (e, s) => const Center(
        child: Text('Uh oh. Something went wrong!'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
