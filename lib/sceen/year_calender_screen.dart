import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hsbc_calender/helper/app_helper.dart';
import '../data/calender_model.dart';
import '../main.dart';
import '../service/language_service.dart';
import '../widgets/calender/calendar_view.dart';

class YearCalenderScreen extends StatefulWidget {
  YearCalenderScreen({Key? key}) : super(key: key);

  @override
  State<YearCalenderScreen> createState() => _YearCalenderScreenState();
}

class _YearCalenderScreenState extends State<YearCalenderScreen> {
  CalenderModel? calenderModel;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        languageService.language == Language.EN
            ? 'assets/json/date_en.json'
            : 'assets/json/date_bn.json');

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
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(calenderModel!.calender![0].year.toString(),
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            children: List.generate(
                                calenderModel!.calender!.length, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    languageService.language == Language.BN
                                        ? "${calenderModel!.calender![index].month}"
                                        : AppHelper.calenderDateToReadAbleDate(
                                                calenderModel!
                                                    .calender![index].month)
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Expanded(
                                      child: AppCalendarView(
                                    month:
                                        calenderModel!.calender![index].month,
                                    year: calenderModel!.calender![index].year,
                                    eventRoundPadding: 2,
                                    isTwelveMonth: true,
                                    calender: calenderModel!.calender![index],
                                  )),
                                ],
                              );
                            })),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
