import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hsbc_calender/data/calender_model.dart';
import 'package:hsbc_calender/sceen/year_calender_screen.dart';
import 'package:hsbc_calender/widgets/calender/calendar_view.dart';
import 'package:intl/intl.dart';

import '../../helper/app_helper.dart';
import '../date_view.dart';

class AppCalender extends StatefulWidget {
  Calender? calender;

  AppCalender({Key? key, required this.calender}) : super(key: key);

  @override
  State<AppCalender> createState() => _AppCalenderState();
}

class _AppCalenderState extends State<AppCalender> {
  TextStyle weekDayStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  List<String> days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

  DateTime today = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Sessonal image : ${widget.calender!.seasonalImage}");
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.calender!.seasonalImage.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    AppHelper.calenderDateToReadAbleDate(
                            widget.calender!.month) +
                        ", " +
                        widget.calender!.year!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => YearCalenderScreen()));
                    },
                    child: Text(
                      "Year at a glance",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.shade200,
            ),
            SizedBox(
              height: 10,
            ),
            widget.calender == null
                ? const CircularProgressIndicator()
                : Expanded(
                    flex: 2,
                    child: AppCalendarView(
                      calender: widget.calender!,
                      month: widget.calender!.month,
                      year: widget.calender!.year,
                    )),
          ],
        ));
  }
}
