//Implémenter "MyAppBar" avec le year picker, month picker et Calendrier

import 'package:flutter/material.dart';
import 'appbar_widgets/my_month_year_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import './body_widgets/changing_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(
            height: screen_height / 16,
          ),
          MyMonthYearPicker(),
          ChangingTextt(DateTime.now()),
        ]));

    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       toolbarHeight: MediaQuery.of(context).size.height / 4.5,
    //       title: MyMonthYearPicker(),
    //     ),
    //     body: Column(
    //       children: [
    //         ChangingTextt(DateTime.now()),
    //       ],
    //     ));
  }
}
