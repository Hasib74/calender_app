import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/calender_model.dart';
import '../helper/app_helper.dart';
import '../main.dart';
import '../packages/bangla_utilities.dart';
import '../service/language_service.dart';
import '../widgets/calender/app_calender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalenderModel? calenderModel;

  PageController? pageController = new PageController();

  var _banglaDateTime = BanglaUtility.getBanglaDate(
      day: DateTime.now().day,
      month: DateTime.now().month,
      year: DateTime.now().year);

  Future readJson() async {
    final String response = await rootBundle.loadString(
        languageService.language == Language.EN
            ? 'assets/json/date_en.json'
            : 'assets/json/date_bn.json');

    setState(() {
      calenderModel = CalenderModel.fromJson(jsonDecode(response));
    });

    return calenderModel;
  }

  @override
  initState() {
    readJson().then((value) {
      _pageViewInitialize();
    });

    super.initState();
  }

  void _pageViewInitialize() {
    print(
        "Bangla now : ${BanglaUtility.getBanglaDateMonthYearSeason(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year)}");
    print(
        "Bangla year : ${BanglaUtility.getBanglaMonthName(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year)}");
    print(
        "Bangla month : ${BanglaUtility.getBanglaMonth(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year)}");
    calenderModel!.calender!.forEach((element) {
      if (element.year.toString() ==
              "${languageService.language == Language.EN ? DateTime.now().year.toString() : BanglaUtility.getBanglaYear(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year)}" &&
          AppHelper.calenderDateToReadAbleDate(element.month) ==
              "${languageService.language == Language.EN ? AppHelper.intMonthToString(DateTime.now().month) : BanglaUtility.getBanglaMonthName(month: DateTime.now().month, year: DateTime.now().year, day: DateTime.now().day)}") {
        if (pageController != null && pageController!.hasClients) {
          pageController!.jumpToPage(calenderModel!.calender!.indexOf(element));
        } else {
          pageController = new PageController(
              initialPage: calenderModel!.calender!.indexOf(element));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image(
              image: AssetImage(
                'assets/logo/skf.png',
              ),
              width: 44,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () async {
                languageService.changeLanguage(
                    languageService.language == Language.BN
                        ? Language.EN
                        : Language.BN);

                readJson().then((value) => _pageViewInitialize());

                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  languageService.language == Language.BN ? "English" : "বাংলা",
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          )
        ],
      ),
      body: calenderModel == null
          ? const CircularProgressIndicator()
          : PageView.builder(
              controller: pageController,
              itemCount: calenderModel!.calender!.length,
              itemBuilder: (context, index) {
                return AppCalender(
                  language: languageService.language,
                  calender: calenderModel!.calender![index],
                );
              }),
    );
  }
}
