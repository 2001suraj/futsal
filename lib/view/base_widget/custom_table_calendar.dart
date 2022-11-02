// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatefulWidget {
  CustomTableCalender({
    Key? key,
    required this.focusedDay,
  }) : super(key: key);
  DateTime focusedDay;
  @override
  State<CustomTableCalender> createState() => _CustomTableCalenderState();
}

class _CustomTableCalenderState extends State<CustomTableCalender> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: CalendarFormat.twoWeeks,
      firstDay: DateTime(
        1990,
      ),
      lastDay: DateTime(2050),
      focusedDay: widget.focusedDay,
      onDaySelected: (selectDay, focuseDay) {
        setState(() {
          selectedDay = selectDay;
          widget.focusedDay = focuseDay;
        });
        print(selectDay);
        print(focuseDay);
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
    );
  }
}
