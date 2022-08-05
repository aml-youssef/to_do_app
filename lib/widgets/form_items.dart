// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/task.dart';

// TextEditingController titleController = TextEditingController();
// TextEditingController deadlineController = TextEditingController();
// late String formatedDeadlineController;
// TextEditingController startTimeController = TextEditingController();
// TextEditingController endTimeController = TextEditingController();
// late String dropdownReminder;
// late String dropdownRepeat;

// Widget titleFormField() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Title',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         TextFormField(
//           // initialValue: '',
//           // decoration: const InputDecoration(
//           //   labelText: 'Title',
//           // ),
//           maxLines: 1,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'provie a value here';
//             }
//             return null;
//           },
//           onSaved: (value) {
//             titleController.text = value!;
//           },
//         ),
//       ],
//     ),
//   );
// }

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

// class DropDownFormField extends StatefulWidget {
//   List<String> options;
//   bool isReminder;
//   String Lable;
//   DropDownFormField(
//       {required this.options, required this.isReminder, required this.Lable});
//   @override
//   State<DropDownFormField> createState() => _DropDownFormFieldState();
// }

// class _DropDownFormFieldState extends State<DropDownFormField> {
//   String? dropdownValue;
//   @override
//   void initState() {
//     dropdownValue = widget.options[0];
//     if (widget.isReminder) {
//       dropdownReminder = widget.options[0];
//     } else {
//       dropdownRepeat = widget.options[0];
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.Lable,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: const Color.fromARGB(255, 230, 230, 230),
//             ),
//             child: DropdownButton(
//               items: [
//                 for (String option in widget.options)
//                   DropdownMenuItem(
//                     value: option,
//                     child: Text(
//                       option,
//                     ),
//                   ),
//               ],
//               icon: const Icon(Icons.expand_more),
//               underline: const SizedBox(),
//               dropdownColor: Colors.white,
//               style: const TextStyle(color: Colors.grey),
//               elevation: 1,
//               isExpanded: true,
//               value: dropdownValue,
//               onChanged: (value) {
//                 setState(() {
//                   if (widget.isReminder) {
//                     dropdownReminder = dropdownValue = value.toString();
//                   } else {
//                     dropdownRepeat = dropdownValue = value.toString();
//                   }
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
