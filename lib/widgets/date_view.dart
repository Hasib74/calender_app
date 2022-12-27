import 'package:flutter/material.dart';

import '../helper/app_helper.dart';

class DateViewWidget extends StatelessWidget {
  String? date;
  String? isWeekend;
  String? day;
  String? event;
  String? description;
  String? image;
  bool? isToday;
  String? year;
  String? month;
  int? dayIndex;

  bool? isYearView; // if true then show only month and year
  String? music;

  double? eventRoundPadding;

  Function(
    String? event,
    String? eventImage,
    String? eventDescription,
    String? eventDate,
    String? music,
  ) onEventClick;

  DateViewWidget(
      {super.key,
      this.date,
      this.isWeekend,
      this.day,
      this.event,
      this.description,
      this.image,
      this.year,
      this.month,
      this.isToday = false,
      required this.onEventClick,
      this.dayIndex,
      this.eventRoundPadding = 8,
      this.music,
      this.isYearView = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isWeekend != null && isWeekend == "true"
            ? Colors.black.withOpacity(0.1)
            : Colors.white,
      ),
      child: InkWell(
        onTap: () {
          if (event != null) {
            String _date = date! +
                ", " +
                AppHelper.calenderDateToReadAbleDate(month) +
                ", " +
                year!;
            onEventClick(event, image, description, _date, music);
          }
        },
        child: Container(
          margin: event != null || isToday == true
              ? EdgeInsets.all(eventRoundPadding!)
              : const EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: _backGroundColor(),
              shape: event != null || isToday == true
                  ? BoxShape.circle
                  : BoxShape.rectangle),
          child: Center(
              child: Text(
            date!.toString(),
            style:
                TextStyle(color: _texColor(), fontSize: isYearView! ? 10 : 16),
          )),
        ),
      ),
    );
  }

  _backGroundColor() {
    if (isWeekend != null && isWeekend == "true") {
      if (isToday == true) {
        return Colors.blue.withOpacity(0.7);
      } else if (event != null) {
        return Colors.orange;
      }
      return Colors.black.withOpacity(0.0);
    } else if (isToday == true) {
      return Colors.blue.withOpacity(0.7);
    } else if (event != null) {
      return Colors.orange.withOpacity(1);
    } else {
      return Colors.white;
    }
  }

  _texColor() {
    print("isWeekend :: $isWeekend");

    print("Day .... ${day}");

    if (day!.toLowerCase() == "fri" ||
        day!.toLowerCase() == "sat" ||
        day == "শুক্র" ||
        day == "শনি") {
      if (event != null) {
        return Colors.white;
      }
      return Colors.red;
    } else if (event != null || isToday == true) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
