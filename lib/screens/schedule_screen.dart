import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/schedule_task_list.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);
  static const routName = '/ScheduleScreen';

  List<Widget> sevenDaysTaps() {
    return [
      for (int i = 0; i < 7; i++)
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text(DateFormat('EEE')
                  .format(DateTime.now().add(Duration(days: i)))),
              Text(DateTime.now().add(Duration(days: i)).day.toString()),
            ],
          ),
        ),
    ];
  }

  List<Widget> sevenDaysTabBarView() {
    return [
      for (int i = 0; i < 7; i++)
        ScheduleTaskList(
          DateTime.now().add(Duration(days: i)),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Schedule'),
            bottom: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              // indicatorPadding: EdgeInsets.all(8),
              // indicatorWeight: 16,
              indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: const Color.fromARGB(255, 39, 240, 143),
              ),
              // BoxDecoration(
              //   borderRadius: BorderRadius.circular(8.0),
              //   color: const Color.fromARGB(255, 78, 247, 165),
              // ),
              padding: const EdgeInsets.only(bottom: 16),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: sevenDaysTaps(),
            ),
          ),
          body: TabBarView(
            children: sevenDaysTabBarView(),
          )),
    );
  }
}
