import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/provider.dart';
import 'schedule_task_item.dart';
import 'package:intl/intl.dart';

class ScheduleTaskList extends ConsumerWidget {
  final DateTime date;
  const ScheduleTaskList(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AsyncValue<List<Task>> tasks = ref.watch(filteredSchedleListProvider(date));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('EEEE').format(date),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(DateFormat('dd MMM,yyyy').format(date)),
              ],
            ),
          ),
          tasks.when(
            data: (data) => data.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text('no taskes for this day'),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      // shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      itemBuilder: (cxt, i) => ScheduleTaskItem(
                        task: data[i],
                      ),
                      itemCount: data.length,
                    ),
                  ),
            error: (e, s) => const Center(
              child: Text('Uh oh. Something went wrong!'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
