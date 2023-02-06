import 'package:flutter/material.dart';
import 'package:skf_calender/sceen/splash_screen.dart';
import 'package:skf_calender/service/language_service.dart';

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
          primarySwatch: MaterialColor(0xff3C8FB6, {
            50: Color(0xff3C8FB6).withOpacity(0.1),
            100: Color(0xff3C8FB6).withOpacity(0.2),
            200: Color(0xff3C8FB6).withOpacity(0.3),
            300: Color(0xff3C8FB6).withOpacity(0.4),
            350: Color(0xff3C8FB6).withOpacity(0.5),
            400: Color(0xff3C8FB6).withOpacity(0.6),
            500: Color(0xff3C8FB6).withOpacity(0.7),
            600: Color(0xff3C8FB6).withOpacity(0.8),
            700: Color(0xff3C8FB6).withOpacity(0.9),
          }),
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
      home: SplashScreen(),
    );
  }
}
