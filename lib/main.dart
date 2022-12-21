import 'package:flutter/material.dart';
import 'package:hsbc_calender/sceen/home_screen.dart';
import 'package:hsbc_calender/service/language_service.dart';

var languageService = new AppLanguageService();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.6,
                height: 2,
                wordSpacing: 0.6),
            headline6: TextStyle(
                fontSize: 16.0,
                letterSpacing: 0.6,
                height: 1,
                wordSpacing: 0.6),
            bodyText2: TextStyle(
                fontSize: 14.0,
                letterSpacing: 0.6,
                height: 1,
                wordSpacing: 0.6),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Hind',
                letterSpacing: 0.6,
                height: 2,
                wordSpacing: 0.6),
          )),
      home: HomeScreen(),
    );
  }
}
