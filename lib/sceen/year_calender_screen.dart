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
    List _years = calenderModel!.calender!.map((e) => e.year).toList();

    _years = _years.toSet().toList();

    print("Years : $_years");

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            languageService.language == Language.EN
                ? "Year at a glance"
                : "বছরের এক নজরে",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: calenderModel == null
            ? const CircularProgressIndicator()
            : SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(
                          itemBuilder: (context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "${_years[index]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                _calenderList(
                                    context,
                                    _years[index],
                                    calenderModel!.calender!
                                        .where((element) =>
                                            element.year == _years[index])
                                        .toList())
                              ],
                            );
                          },
                          separatorBuilder: (context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: _years.length),
                    )),
              ));
  }

  _calenderList(
      BuildContext context, String years, List<Calender> calenderList) {
    return Container(
      //height: 200,
      child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // to disable GridView's scrolling

          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: List.generate(calenderList.length, (index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageService.language == Language.BN
                      ? "${calenderList[index].month}"
                      : AppHelper.calenderDateToReadAbleDate(
                              calenderList[index].month)
                          .toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                    child: AppCalendarView(
                  month: calenderList[index].month,
                  year: calenderList[index].year,
                  eventRoundPadding: 2,
                  isTwelveMonth: true,
                  calender: calenderList[index],
                )),
              ],
            );
          })),
    );
  }
}
