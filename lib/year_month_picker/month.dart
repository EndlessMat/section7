import 'package:flutter/material.dart';

class MyMonth extends StatelessWidget {
  int month;

  MyMonth({super.key, required this.month});

  List months = [
    'January',
    'February',
    'March',
    'April',
    "May",
    "June",
    "July",
    'August',
    "September",
    "October",
    'November',
    'December'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0.5),
        color: Colors.black,
        child: Center(
          child: Text(
            months[month],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ));
  }
}
