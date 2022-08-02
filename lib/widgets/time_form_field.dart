import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

TextEditingController startTimeController = TextEditingController();
TextEditingController endTimeController = TextEditingController();

class TimeFormField extends StatelessWidget {
  String lable;
  bool start;
  TimeFormField({required this.lable, required this.start});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lable,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              // decoration: InputDecoration(labelText: lable),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'provie a value here';
                }
                return null;
              },
              onSaved: (value) {
                if (start) {
                  startTimeController.text = value!;
                } else {
                  endTimeController.text = value!;
                }
              },
              controller: start ? startTimeController : endTimeController,
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                );
                if (time != null) {
                  if (start) {
                    startTimeController.text = Task.timeOfDayToString(time);
                  } else {
                    endTimeController.text = Task.timeOfDayToString(time);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
