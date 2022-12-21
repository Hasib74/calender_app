import 'package:hsbc_calender/main.dart';
import 'package:hsbc_calender/service/language_service.dart';

class AppHelper {
  static String calenderDateToReadAbleDate(String? month) {
    if (languageService.language == Language.BN) {
      return month!;
    }

    String? _month;

    print("month :: $month");

    switch (month) {
      case "jan":
        _month = "January";
        break;
      case "feb":
        _month = "February";
        break;
      case "mar":
        _month = "March";
        break;
      case "apr":
        _month = "April";
        break;
      case "may":
        _month = "May";
        break;
      case "jun":
        _month = "June";
        break;
      case 'jul':
        _month = "July";
        break;
      case "aug":
        _month = "August";
        break;
      case "sep":
        _month = "September";
        break;
      case "oct":
        _month = "October";
        break;
      case "nov":
        _month = "November";
        break;
      case "dec":
        _month = "December";
        break;
    }

    return _month!;
  }
}
