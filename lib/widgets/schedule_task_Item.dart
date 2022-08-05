import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';
import '../models/task.dart';

class ScheduleTaskItem extends ConsumerWidget {
  Task task;
  ScheduleTaskItem({required this.task});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(tasksProvider);

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ListTile(
          title: Text(Task.timeOfDayToString(task.startTime)),
          subtitle: Text(task.title),
          trailing: task.isComplete
              ? const Icon(Icons.check_circle_outline)
              : const Icon(Icons.circle_outlined),
          // dense: true,
          onTap: () async =>
              await ref.read(tasksProvider.notifier).toggle(task.id!)),
    );
  }
}
