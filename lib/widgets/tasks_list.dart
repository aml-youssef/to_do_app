import 'package:flutter/cupertino.dart';
import 'Task_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tasks.dart';
import '../models/task.dart';
import '../constants/provider.dart';
import './schedule_task_Item.dart';

class TaskList extends ConsumerWidget {
  FilterType type;
  TaskList(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Task> tasks = ref.watch(filteredTodoListProvider(type));

    return ListView.builder(
      itemBuilder: (cxt, i) => TaskItem(
        task: tasks[i],
      ),
      itemCount: tasks.length,
    );
  }
}
