import 'package:flutter/cupertino.dart';
import 'Task_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tasks.dart';
import '../models/task.dart';
import '../constants/provider.dart';
import './schedule_task_Item.dart';
import 'package:intl/intl.dart';

class ScheduleTaskList extends ConsumerWidget {
  DateTime date;
  ScheduleTaskList(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Task> tasks = ref.watch(filteredSchedleListProvider(date));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('EEEE').format(date),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(DateFormat('dd MMM,yyyy').format(date)),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemBuilder: (cxt, i) => ScheduleTaskItem(
              task: tasks[i],
            ),
            itemCount: tasks.length,
          ),
        ],
      ),
    );
  }
}
