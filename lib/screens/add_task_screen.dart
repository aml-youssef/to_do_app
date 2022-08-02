import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import '../widgets/form_items.dart';
import '../models/tasks.dart';
import '../models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';
import '../widgets/dropdown_form_field.dart';
import '../widgets/time_form_field.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static const routName = '/addTask';

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _form = GlobalKey<FormState>();

  static const List<String> reminderOptions = [
    "10 minutes before",
    "30 minutes before",
    "1 hour before",
    "day before",
  ];

  static const List<String> repeatOptions = [
    "daily",
    "weekly",
  ];

  Future<void> _saveForm() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState!.save();

    Task newTask = Task(
        // id: ,
        date: Task.stringToDateTime(formatedDeadlineController),
        startTime: Task.stringToTimeOfDay(startTimeController.text),
        endTime: Task.stringToTimeOfDay(endTimeController.text),
        reminder: Task.mapToReminder(dropdownReminder),
        title: titleController.text);

    await ref.read(tasksProvider.notifier).addTask(newTask);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('the Task was Added')),
    );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.clear();
    deadlineController.clear();
    startTimeController.clear();
    endTimeController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                titleFormField(),
                DeadlineFormField(),
                Row(
                  children: [
                    TimeFormField(lable: 'Start time', start: true),
                    TimeFormField(lable: 'End time', start: false),
                  ],
                ),
                DropDownFormField(
                  options: reminderOptions,
                  Lable: 'reminder',
                  isReminder: true,
                ),
                DropDownFormField(
                  options: repeatOptions,
                  Lable: 'Repeat',
                  isReminder: false,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _saveForm,
          child: const Text('Create a Task'),
        ),
      ),
    );
  }
}
