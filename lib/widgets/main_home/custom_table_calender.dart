import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatelessWidget {
  const CustomTableCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("123"),
        Container(
            child: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030),
        ))
      ],
    );
  }
}
