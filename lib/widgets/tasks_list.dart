import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Task_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tasks.dart';
import '../models/task.dart';
import '../providers/provider.dart';
import './schedule_task_Item.dart';

class TaskList extends ConsumerWidget {
  FilterType type;
  TaskList(this.type, {Key? key}) : super(key: key);

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
