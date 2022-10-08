//Implémenter "MyAppBar" avec le year picker, month picker et Calendrier

import 'package:flutter/material.dart';
import 'year_month_picker/my_year_month_picker.dart';
import 'my_month_picker.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyYearPicker(),
      //MyMonthPicker(),
    );
  }
}
