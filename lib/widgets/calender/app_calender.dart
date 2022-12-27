import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/calender_model.dart';
import '../../helper/app_helper.dart';
import '../../main.dart';
import '../../sceen/year_calender_screen.dart';
import '../../service/language_service.dart';
import '../date_view.dart';
import 'calendar_view.dart';

class AppCalender extends StatefulWidget {
  Language? language;

  Calender? calender;

  AppCalender({Key? key, required this.calender, required this.language})
      : super(key: key);

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

  // List<String> days = wi == Language.BN
  //     ? ["রবি", "সোম", "মঙ্গল", "বুধ", "বৃহঃ", "শুক্র", "শনি"]
  //     : ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

  DateTime today = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Sessonal image : ${widget.calender!.seasonalImage}");
    print("Year ====  : ${widget.calender!.year}");
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: widget.calender!.seasonalImage.toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
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
                    languageService.language == Language.EN
                        ? AppHelper.calenderDateToReadAbleDate(
                                widget.calender!.month) +
                            ", " +
                            widget.calender!.year!
                        : "${widget.calender!.month}" +
                            ", " +
                            widget.calender!.year!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                      widget.language == Language.EN
                          ? "Year at a glance"
                          : "বছরের এক নজরে",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
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
                      language: widget.language,
                      calender: widget.calender!,
                      month: widget.calender!.month,
                      year: widget.calender!.year,
                    )),
          ],
        ));
  }
}
