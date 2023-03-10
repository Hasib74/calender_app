import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/calender_model.dart';
import '../../main.dart';
import '../../packages/bangla_utilities.dart';
import '../../sceen/event_details_screen.dart';
import '../../service/language_service.dart';
import '../date_view.dart';

class AppCalendarView extends StatefulWidget {
  String? month;
  String? year;
  Calender calender;

  double? eventRoundPadding;

  bool isTwelveMonth = false;

  Language? language;

  AppCalendarView(
      {Key? key,
      required this.calender,
      this.month,
      this.year,
      this.isTwelveMonth = false,
      this.language,
      this.eventRoundPadding = 8})
      : super(key: key);

  @override
  State<AppCalendarView> createState() => _AppCalendarViewState();
}

class _AppCalendarViewState extends State<AppCalendarView> {
  TextStyle weekDayStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  List<String>? days;

  DateTime today = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState

    days = languageService.language == Language.BN
        ? ["রবি", "সোম", "মঙ্গল", "বুধ", "বৃহঃ", "শুক্র", "শনি"]
        : ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.language != null) {
      days = widget.language == Language.BN
          ? ["রবি", "সোম", "মঙ্গল", "বুধ", "বৃহঃ", "শুক্র", "শনি"]
          : ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
    }
    return _calender_view();
  }

  Widget _calender_view() {
    print("Calender length :: ${widget.calender.data!.length}");
    var _data = widget.calender.data;

    String day = _data![0].day!;

    int dateIndex = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          _days(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              crossAxisCount: 7,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              childAspectRatio: 5 / 4,
              children: List.generate(42, (index) {
                Widget _widget = new Container();

                if (index <= 6) {
                  if (day.toLowerCase() == days![index].toLowerCase()) {
                    _widget = _widget = DateViewWidget(
                      isYearView: widget.isTwelveMonth,
                      eventRoundPadding: widget.eventRoundPadding,
                      date: _data[dateIndex].date.toString(),
                      isWeekend: _data[dateIndex].isWeekend,
                      day: _data[dateIndex].day,
                      event: _data[dateIndex].event,
                      description: _data[dateIndex].eventDescription,
                      image: _data[dateIndex].eventImage,
                      isToday: _isToday(_data[dateIndex].date.toString()),
                      onEventClick: _handleEventClick,
                      month: widget.month,
                      year: widget.year,
                      music: _data[dateIndex].music,
                    );

                    dateIndex += 1;

                    print("dateIndex :: $dateIndex");

                    print("Date ====>  :: ${_data[dateIndex].date.toString()}");
                  } else if (dateIndex != 0) {
                    _widget = DateViewWidget(
                      isYearView: widget.isTwelveMonth,
                      eventRoundPadding: widget.eventRoundPadding,
                      date: _data[dateIndex].date.toString(),
                      isWeekend: _data[dateIndex].isWeekend,
                      day: _data[dateIndex].day,
                      event: _data[dateIndex].event,
                      description: _data[dateIndex].eventDescription,
                      image: _data[dateIndex].eventImage,
                      isToday: _isToday(_data[dateIndex].date.toString()),
                      onEventClick: _handleEventClick,
                      month: widget.month,
                      year: widget.year,
                      music: _data[dateIndex].music,
                    );

                    dateIndex += 1;

                    print("dateIndex :: $dateIndex");

                    print("Date ====>  :: ${_data[dateIndex].date.toString()}");
                  }
                } else {
                  if (_data.asMap().keys.contains(dateIndex)) {
                    _widget = DateViewWidget(
                      isYearView: widget.isTwelveMonth,
                      eventRoundPadding: widget.eventRoundPadding,
                      date: _data[dateIndex].date.toString(),
                      isWeekend: _data[dateIndex].isWeekend,
                      day: _data[dateIndex].day,
                      event: _data[dateIndex].event,
                      description: _data[dateIndex].eventDescription,
                      image: _data[dateIndex].eventImage,
                      isToday: _isToday(_data[dateIndex].date.toString()),
                      onEventClick: _handleEventClick,
                      month: widget.month,
                      year: widget.year,
                      music: _data[dateIndex].music,
                    );

                    print("dateIndex :: $dateIndex");

                    print("Date ====>  :: ${_data[dateIndex].date.toString()}");
                    dateIndex += 1;
                  } else {
                    return Container();
                  }
                }
                return _widget;
              }),
            ),
          )
        ],
      ),
    );
  }

  _handleEventClick(String? event, String? eventImage, String? eventDescription,
      String? eventDate, String? music) {
    print("Event : $event");
    print("Event Image : $eventImage");
    print("Event Description : $eventDescription");
    print("Event Music : ${music!.isNotEmpty}");

    showBottomSheet(
        context: context,
        builder: (context) {
          return InkWell(
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(
                        event: event,
                        eventImage: eventImage,
                        eventDes: eventDescription,
                        eventDate: eventDate,
                        music: music,
                      )));
            },
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(event!),
                  Icon(Icons.chevron_right_outlined),
                ],
              ),
            ),
          );
        });
  }

  Row _days() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days!.asMap().values.map((e) {
        return Expanded(
          child: Text(
            widget.isTwelveMonth ? e[0] : e,
            textAlign: TextAlign.center,
            style: weekDayStyle(
                color: days?.indexOf(e) == 5 || days?.indexOf(e) == 6
                    ? Colors.red
                    : Colors.black),
          ),
        );
      }).toList(),
    );
  }

  _isToday(String date) {
    String _todayDate = DateFormat("dd").format(DateTime.now());
    String _todayMonth = DateFormat("MMM").format(DateTime.now());

    print("Today Date :: $_todayDate");
    print("Today Month :: ${_todayMonth.toLowerCase()}");
    print("Date :: $date");
    print("Month :: ${widget.calender.month!.toLowerCase()}");

    if ("${languageService.language == Language.EN ? _todayDate.toLowerCase() : BanglaUtility.getBanglaDay(day: DateTime.now().day - 1, month: DateTime.now().month, year: DateTime.now().year)}" ==
            date.toString() &&
        "${languageService.language == Language.EN ? _todayMonth.toLowerCase() : BanglaUtility.getBanglaMonthName(day: DateTime.now().day - 1, month: DateTime.now().month, year: DateTime.now().year)}" ==
            widget.calender.month!.toLowerCase() &&
        widget.year ==
            "${languageService.language == Language.EN ? DateTime.now().year : BanglaUtility.getBanglaYear(year: DateTime.now().year, month: DateTime.now().month, day: DateTime.now().day - 1)}") {
      return true;
    } else {
      return false;
    }
  }
}
