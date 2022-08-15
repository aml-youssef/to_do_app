import 'package:flutter/material.dart';

TextEditingController titleController = TextEditingController();

class TitleFormField extends StatelessWidget {
  const TitleFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
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
            maxLength: 30,
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
}
