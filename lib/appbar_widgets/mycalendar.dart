import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  //const MyCalendar({Key? key}) : super(key: key);

  final int days_in_month;
  final String month;

  MyCalendar(this.days_in_month, this.month);

  @override
  State<MyCalendar> createState() {
    return _MyCalendarState(days_in_month, month);
  }
}

class _MyCalendarState extends State<MyCalendar> {
  int days_in_month;
  String month;

  _MyCalendarState(this.days_in_month, this.month);
  late DateTime lastDayOfMonth;

  int selectedIndex = (DateTime.now().day).toInt();

  @override
  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    return Column(children: [
      Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screen_height / 10,
            child: ListView.builder(
              itemCount: days_in_month,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: screen_height / 10,
                width: screen_height / 10,
                margin: EdgeInsets.all(screen_width / 30),
                color: Colors.green[700],
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Text(
                          month.substring(0, 3),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
