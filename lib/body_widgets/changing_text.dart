import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangingTextt extends StatelessWidget {
  DateTime datetime;

  ChangingTextt(this.datetime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        DateTime.now() == datetime ? 'Not today' : 'Today',
        style: GoogleFonts.slabo27px(
          textStyle: TextStyle(
            fontSize: 27,
            color: Colors.blueGrey.shade900,
          ),
        ),
      ),
    );
  }
}
