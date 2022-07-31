import 'package:flutter/material.dart';
import './screens/board_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/add_task_screen.dart';
import './screens/schedule_screen.dart';

void main() {
  runApp(const ProviderScope(child: ToDoApp()));
  // runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BoardScreen(),
      routes: {
        AddTaskScreen.routName: (cxt) => AddTaskScreen(),
        ScheduleScreen.RoutName: (cxt) => ScheduleScreen(),
      },
    );
  }
}
