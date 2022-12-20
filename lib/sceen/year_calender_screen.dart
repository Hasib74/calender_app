import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hsbc_calender/helper/app_helper.dart';

import '../data/calender_model.dart';
import '../widgets/calender/calendar_view.dart';

class YearCalenderScreen extends StatefulWidget {
  YearCalenderScreen({Key? key}) : super(key: key);

  @override
  State<YearCalenderScreen> createState() => _YearCalenderScreenState();
}

class _YearCalenderScreenState extends State<YearCalenderScreen> {
  CalenderModel? calenderModel;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/calender.json');

    setState(() {
      calenderModel = CalenderModel.fromJson(jsonDecode(response));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readJson();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: calenderModel == null
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: List.generate(2, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppHelper.calenderDateToReadAbleDate(
                                    calenderModel!.calender![index].month)
                                .toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                              child: AppCalendarView(
                            month: calenderModel!.calender![index].month,
                            year: calenderModel!.calender![index].year,
                            eventRoundPadding: 2,
                            isTwelveMonth: true,
                            calender: calenderModel!.calender![index],
                          )),
                        ],
                      );
                    })),
              ));
  }
}
