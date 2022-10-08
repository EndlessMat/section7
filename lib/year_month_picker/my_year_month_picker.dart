import 'package:flutter/material.dart';
import './year.dart';
import './month.dart';

class MyYearPicker extends StatefulWidget {
  const MyYearPicker({super.key});

  @override
  State<MyYearPicker> createState() => _MyYearPickerState();
}

class _MyYearPickerState extends State<MyYearPicker> {
  late FixedExtentScrollController _controller;
  int currentMonthSelected = ((DateTime.now().month).toInt());

  List<String> months = [
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
  String the_month = [
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
  ][((DateTime.now().month).toInt())];

  int currentYearSelected = ((DateTime.now().year).toInt());
  String the_year = ((DateTime.now().year).toInt()).toString();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
    currentMonthSelected = (DateTime.now().month).toInt();
    String theMonth = months[currentMonthSelected];

    currentYearSelected = (DateTime.now().year).toInt();
    String theYear = currentYearSelected.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('$the_month $the_year '),
        onPressed: (() => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Row(children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 300,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) => setState(() {
                            currentMonthSelected = value;
                          }),
                          controller: _controller,
                          physics: const FixedExtentScrollPhysics(),
                          // useMagnifier: true,
                          // magnification: 1.25,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 12,
                            builder: ((context, index) {
                              return MyMonth(month: (index));
                            }),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        height: 300,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) => setState(() {
                            currentYearSelected = value;
                          }),
                          controller: _controller,
                          physics: const FixedExtentScrollPhysics(),
                          // useMagnifier: true,
                          // magnification: 1.25,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 5,
                            builder: ((context, index) {
                              return MyYear(year: (index + 2022));
                            }),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              );
            })),
      ),
    );
  }
}
