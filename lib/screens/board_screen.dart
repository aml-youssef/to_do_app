import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/tasks_list.dart';
import '../providers/provider.dart';
import '../screens/add_task_screen.dart';
import '../models/task.dart';
import '../models/tasks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './schedule_screen.dart';
import '../models/task.dart';

// class BoardScreen extends ConsumerStatefulWidget {
//   const BoardScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<BoardScreen> createState() => _BoardScreenState();
// }

// class _BoardScreenState extends ConsumerState<BoardScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Board'),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed(ScheduleScreen.RoutName);
//               },
//               icon: const Icon(
//                 Icons.notifications,
//               ),
//             ),
//           ],
//           bottom: const TabBar(
//             //labelPadding: ,
//             // onTap: (value) {
//             // },
//             isScrollable: true,
//             indicatorSize: TabBarIndicatorSize.label,
//             tabs: [
//               Tab(text: 'all'),
//               Tab(text: 'completed'),
//               Tab(text: 'uncompleted'),
//               Tab(text: 'favorites'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             TaskList(FilterType.all),
//             TaskList(FilterType.completed),
//             TaskList(FilterType.uncompleted),
//             TaskList(FilterType.favorite),
//           ],
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ElevatedButton(
//             child: const Text('Add a Task'),
//             onPressed: () {
//               Navigator.of(context).pushNamed(AddTaskScreen.routName);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

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
                Navigator.of(context).pushNamed(ScheduleScreen.RoutName);
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
        body: TabBarView(
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
