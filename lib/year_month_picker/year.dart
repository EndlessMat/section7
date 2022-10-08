import 'package:flutter/material.dart';

class MyYear extends StatelessWidget {
  int year;

  MyYear({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0.5),
        color: Colors.black,
        child: Center(
          child: Text(
            year.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ));
  }
}
