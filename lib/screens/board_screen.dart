import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_app/widgets/loading_screen.dart';
import '../widgets/tasks_list.dart';
import '../constants/provider.dart';
import '../screens/add_task_screen.dart';
import '../models/task.dart';
import '../models/tasks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './schedule_screen.dart';

class BoardScreen extends ConsumerStatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends ConsumerState<BoardScreen> {
  // bool _isLoading = false;

  @override
  void initState() {
    // setState(() {
    //   _isLoading = true;
    // });

    // ref.read(tasksProvider.notifier).fetchAlldata().then((value) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    // super.initState();
  }

  @override
  void dispose() {
    // ref.read(tasksProvider.notifier).close().then((value) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Board'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ScheduleScreen.RoutName);
              },
              icon: const Icon(
                Icons.notifications,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
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
        body: TabBarView(
          children: [
            // _isLoading ? const LoadingScreen() : TaskList(FilterType.all),

            TaskList(FilterType.all),
            TaskList(FilterType.completed),
            TaskList(FilterType.uncompleted),
            TaskList(FilterType.favorite),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
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
