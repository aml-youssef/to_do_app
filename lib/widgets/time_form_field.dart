import 'package:flutter/material.dart';
import '../models/task.dart';

TextEditingController startTimeController = TextEditingController();
TextEditingController endTimeController = TextEditingController();
int toDouble(TimeOfDay myTime) => myTime.hour * 60 + myTime.minute;

class TimeFormField extends StatelessWidget {
  final String lable;
  final bool start;
  const TimeFormField({super.key ,required this.lable, required this.start});

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

                if (startTimeController.text.isNotEmpty &&
                    endTimeController.text.isNotEmpty &&
                    toDouble(
                            Task.stringToTimeOfDay(startTimeController.text)) >=
                        toDouble(
                            Task.stringToTimeOfDay(endTimeController.text))) {
                  return 'provid a valid time';
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
              readOnly: true,
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
