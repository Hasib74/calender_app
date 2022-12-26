import 'package:hsbc_calender/main.dart';
import 'package:hsbc_calender/service/language_service.dart';

class AppHelper {
  static String calenderDateToReadAbleDate(String? month) {
    if (languageService.language == Language.BN) {
      return month!;
    }

    String? _month;

    print("month :: $month");

    switch (month.toString().toLowerCase()) {
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

 static String intMonthToString(int month) {
    print("Month :: $month");
    String? _month = "";
    switch (month) {
      case 1:
        _month = "January";
        break;
      case 2:
        _month = "February";
        break;
      case 3:
        _month = "March";
        break;
      case 4:
        _month = "April";
        break;
      case 5:
        _month = "May";
        break;
      case 6:
        _month = "June";
        break;
      case 7:
        _month = "July";
        break;
      case 8:
        _month = "August";
        break;
      case 9:
        _month = "September";
        break;
      case 10:
        _month = "October";
        break;
      case 11:
        _month = "November";
        break;
      case 12:
        _month = "December";
        break;
    }

    return _month;
  }
}
