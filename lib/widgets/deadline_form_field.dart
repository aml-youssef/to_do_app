import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
TextEditingController deadlineController = TextEditingController();
String formatedDeadlineController = '';


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
              if (value == null ||
                  value.isEmpty ||
                  formatedDeadlineController.isEmpty) {
                return 'provie a value here';
              }
              return null;
            },
            onSaved: (value) {
              deadlineController.text = value!;
            },
            readOnly: true,
            controller: deadlineController,
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 360 * 2)),
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
