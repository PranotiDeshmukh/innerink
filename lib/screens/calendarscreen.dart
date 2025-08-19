import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendarscreen extends StatefulWidget {
  const Calendarscreen({super.key});

  @override
  State<Calendarscreen> createState() => _CalendarscreenState();
}

class _CalendarscreenState extends State<Calendarscreen> {
   DateTime _focusedDay = DateTime.now();
   DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 230, 161, 243),
     appBar: AppBar(
       backgroundColor:Color.fromARGB(255, 230, 161, 243),
      title: Text("Calendar",style: TextStyle(color:const Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold ),),),

     body: TableCalendar(
      focusedDay: _focusedDay,
       firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        
        onDaySelected: (selectedDay, focusedday)
        {
          setState(() {
            _selectedDay =selectedDay;
            _focusedDay=focusedday;
          });
        },
        calendarFormat: CalendarFormat.month,
        ),
    );
  }
}