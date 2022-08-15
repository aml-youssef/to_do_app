import 'package:flutter/material.dart';

late String dropdownReminder;
late String dropdownRepeat;

class DropDownFormField extends StatefulWidget {
  final List<String> options;
  final bool isReminder;
  final String lable;
   const DropDownFormField(
      {super.key, required this.options, required this.isReminder, required this.lable});
  @override
  State<DropDownFormField> createState() => _DropDownFormFieldState();
}

class _DropDownFormFieldState extends State<DropDownFormField> {
  String? dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.options[0];
    if (widget.isReminder) {
      dropdownReminder = widget.options[0];
    } else {
      dropdownRepeat = widget.options[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.lable,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(255, 230, 230, 230),
            ),
            child: DropdownButton(
              items: [
                for (String option in widget.options)
                  DropdownMenuItem(
                    value: option,
                    child: Text(
                      option,
                    ),
                  ),
              ],
              icon: const Icon(Icons.expand_more),
              underline: const SizedBox(),
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.grey),
              elevation: 1,
              isExpanded: true,
              value: dropdownValue,
              onChanged: (value) {
                setState(() {
                  if (widget.isReminder) {
                    dropdownReminder = dropdownValue = value.toString();
                  } else {
                    dropdownRepeat = dropdownValue = value.toString();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
