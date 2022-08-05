import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';
import '../models/task.dart';

class TaskItem extends ConsumerWidget {
  Task task;
  TaskItem({required this.task});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(tasksProvider);

    return Card(
      child: CheckboxListTile(
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        // activeColor: const Color.fromARGB(255, 78, 247, 165),
        // checkColor: const Color.fromARGB(255, 78, 247, 165),

        onChanged: (bool? value) async {
          await ref.read(tasksProvider.notifier).toggle(task.id!);
        },
        controlAffinity: ListTileControlAffinity.leading,

        value: task.isComplete,
        title: Text(task.title, softWrap: true),
        tileColor: task.isFavorite
            ? const Color.fromARGB(255, 250, 145, 145)
            : Colors.white,
        secondary: PopupMenuButton(
          onSelected: (action) async {
            if (action == "remove") {
              await ref.read(tasksProvider.notifier).removeItem(task.id!);
            } else {
              await ref.read(tasksProvider.notifier).addToFavorite(task.id!);
            }
          },
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (_) => [
            PopupMenuItem(
              value:
                  task.isFavorite ? "remove from favorite" : "add to favorite",
              child: task.isFavorite
                  ? const Text("remove from favorite")
                  : const Text("add to favorite"),
            ),
            const PopupMenuItem(
              value: 'remove',
              child: Text("remove"),
            ),
          ],
        ),
      ),
    );
  }
}
