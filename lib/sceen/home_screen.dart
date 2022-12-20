import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hsbc_calender/widgets/calender/app_calender.dart';

import '../data/calender_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalenderModel? calenderModel;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/calender.json');

    setState(() {
      calenderModel = CalenderModel.fromJson(jsonDecode(response));
    });
  }

  @override
  initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'GDN calendar',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.notifications_none_sharp,
          color: Colors.black,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "বাংলা",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: calenderModel == null
          ? const CircularProgressIndicator()
          : PageView.builder(
              itemCount: calenderModel!.calender!.length,
              itemBuilder: (context, index) {
                return AppCalender(
                  calender: calenderModel!.calender![index],
                );
              }),
    );
  }
}
