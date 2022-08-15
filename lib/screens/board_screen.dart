import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';
import '../screens/add_task_screen.dart';
import '../models/task.dart';
import './schedule_screen.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);
  static const routName = '/board';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Board'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ScheduleScreen.routName);
              },
              icon: const Icon(
                Icons.notifications,
              ),
            ),
          ],
          bottom: const TabBar(
            //labelPadding: ,
            // onTap: (value) {
            // },
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'all'),
              Tab(text: 'completed'),
              Tab(text: 'uncompleted'),
              Tab(text: 'favorites'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TaskList(FilterType.all),
            TaskList(FilterType.completed),
            TaskList(FilterType.uncompleted),
            TaskList(FilterType.favorite),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: const Text('Add a Task'),
            onPressed: () {
              Navigator.of(context).pushNamed(AddTaskScreen.routName);
            },
          ),
        ),
      ),
    );
  }
}
