import 'package:flutter/material.dart';
import 'package:to_do_app/screens/splash_screen.dart';
import './screens/board_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/add_task_screen.dart';
import './screens/schedule_screen.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: ToDoApp()));
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      home: const SplashScreen(),
      routes: {
        AddTaskScreen.routName: (cxt) => const AddTaskScreen(),
        ScheduleScreen.routName: (cxt) => const ScheduleScreen(),
        BoardScreen.routName: (cxt) => const BoardScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black //text color
            ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
        ),
        // primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.red)),
        // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary,),

        // colorScheme: const ColorScheme.light()
        //     .copyWith(primary: Colors.white10, secondary: Colors.yellow,),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color.fromARGB(255, 230, 230, 230),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
        timePickerTheme: TimePickerThemeData(
            backgroundColor: const Color.fromARGB(255, 39, 240, 143),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0))),

        toggleableActiveColor: const Color.fromARGB(255, 238, 34, 34),
        splashColor: Colors.yellow,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 39, 240, 143),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        )),
      ),
    );
  }
}
