import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

TextEditingController titleController = TextEditingController();
TextEditingController deadlineController = TextEditingController();
late String formatedDeadlineController;

Widget titleFormField() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          // initialValue: '',
          // decoration: const InputDecoration(
          //   labelText: 'Title',
          // ),
          maxLines: 1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'provie a value here';
            }
            return null;
          },
          onSaved: (value) {
            titleController.text = value!;
          },
        ),
      ],
    ),
  );
}

// Widget deadlineFormField(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Deadline',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         TextFormField(
//           // decoration: const InputDecoration(labelText: 'Deadline'),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'provie a value here';
//             }
//             return null;
//           },
//           onSaved: (value) {
//             deadlineController.text = value!;
//           },
//           controller: deadlineController,
//           onTap: () async {
//             DateTime? date = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2050),
//             );
//             if (date != null) {
//               deadlineController.text =
//                   DateFormat('yyy - MM - dd').format(date);
//               formatedDeadlineController = date.toIso8601String();
//             }
//           },
//         ),
//       ],
//     ),
//   );
// }

class DeadlineFormField extends StatelessWidget {
  const DeadlineFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Deadline',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            // decoration: const InputDecoration(labelText: 'Deadline'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'provie a value here';
              }
              return null;
            },
            onSaved: (value) {
              deadlineController.text = value!;
            },
            controller: deadlineController,
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Color.fromARGB(255, 39, 240, 143),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: const Color.fromARGB(255, 39, 240, 143),
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (date != null) {
                deadlineController.text =
                    DateFormat('yyy - MM - dd').format(date);
                formatedDeadlineController = date.toIso8601String();
              }
            },
          ),
        ],
      ),
    );
  }
}

// Widget timeFormField(BuildContext context, String lable, bool start) {
//   return Flexible(
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               lable,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           TextFormField(
//             // decoration: InputDecoration(labelText: lable),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'provie a value here';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               if (start) {
//                 startTimeController.text = value!;
//               } else {
//                 endTimeController.text = value!;
//               }
//             },
//             controller: start ? startTimeController : endTimeController,
//             onTap: () async {
//               TimeOfDay? time = await showTimePicker(
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//                 initialEntryMode: TimePickerEntryMode.input,
//               );
//               if (time != null) {
//                 if (start) {
//                   startTimeController.text = Task.timeOfDayToString(time);
//                 } else {
//                   endTimeController.text = Task.timeOfDayToString(time);
//                 }
//               }
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }

