// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
   DateTimePicker({Key? key, required this.controller}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {

    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: '(yyyy-mm-dd)',
         hintStyle: TextStyle(color: Colors.grey[300]),
        filled: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      controller: widget.controller,
      onTap: () async {
        DateTime? pickData = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2023));
        if (pickData == null) {
          print('date is not selected');
        } else {
          print(pickData);
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickData);
          print(formattedDate);

          setState(() {
            widget.controller.text = formattedDate;
          });
        }
      },
      readOnly: true,
    );
  }
}
