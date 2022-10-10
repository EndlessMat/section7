import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './mycalendar.dart';

class MyMonthYearPicker extends StatefulWidget {
  const MyMonthYearPicker({Key? key}) : super(key: key);
  @override
  _MyMonthYearPickerState createState() => _MyMonthYearPickerState();
}

class _MyMonthYearPickerState extends State<MyMonthYearPicker> {
  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }

  final months = [
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

  final years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];

  int selected_month = DateTime.now().month - 1;
  int selected_year = DateTime.now().year - 2020;

  @override
  Widget build(BuildContext context) {
    int day_in_month = getDaysInMonth(selected_year + 2020, selected_month + 1);
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    final font_style = GoogleFonts.slabo27px(
        textStyle: TextStyle(
      fontSize: 25,
      color: Colors.blueGrey.shade900,
    ));

    return Column(
      children: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: Colors.blueGrey.shade900),
              padding: EdgeInsets.all(screen_width / 26),
              backgroundColor: Colors.white,
            ),
            child: Text('${months[selected_month]} ${years[selected_year]}',
                style: font_style), //Here is where I want to get the text
            onPressed: () async {
              await showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    //final screen_width = MediaQuery.of(context).size.width;
                    return Container(
                      color: Colors.white,
                      height: screen_height / 2.5,
                      child: Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: screen_width / 2,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 50,
                                controller: FixedExtentScrollController(
                                  initialItem: (selected_month),
                                ),
                                perspective: 0.001,
                                diameterRatio: 1.6,
                                physics: FixedExtentScrollPhysics(),
                                squeeze: 1.0,
                                overAndUnderCenterOpacity: 0.2,
                                useMagnifier: true,
                                magnification: 1.3,
                                onSelectedItemChanged: (index) {
                                  selected_month = index;
                                  day_in_month = getDaysInMonth(
                                      selected_year + 2020, selected_month + 1);

                                  setState(() {}); // onchange update the ui
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: months.length,
                                  builder: (context, index) {
                                    return Container(
                                      child: Text(
                                        "${months[index]}",
                                        style: font_style,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: screen_width / 2,
                              child: ListWheelScrollView.useDelegate(
                                itemExtent: 50,
                                controller: FixedExtentScrollController(
                                  initialItem: (selected_year),
                                ),
                                perspective: 0.001,
                                diameterRatio: 1.6,
                                physics: FixedExtentScrollPhysics(),
                                squeeze: 1.0,
                                overAndUnderCenterOpacity: 0.2,
                                useMagnifier: true,
                                magnification: 1.3,
                                onSelectedItemChanged: (index) {
                                  selected_year = index;
                                  day_in_month = getDaysInMonth(
                                      selected_year + 2020, selected_month + 1);

                                  setState(() {}); // onchange update the ui
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: years.length,
                                  builder: (context, index) {
                                    return Container(
                                      child: Text(
                                        "${years[index]}",
                                        style: font_style,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
              //setState(() {}); //or on closing the dialog
            },
          ),
        ),
        SizedBox(height: screen_height / 40),
        Text(
          day_in_month.toString(),
          style: TextStyle(color: Colors.black),
        ),
        MyCalendar(day_in_month, months[selected_month]),
      ],
    );
  }
}
