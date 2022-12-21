import 'package:get/get.dart';

class AppLanguageService  {



  //singleton

  Language? language = Language.BN;

  static final AppLanguageService _languageService =
      AppLanguageService._internal();

  factory AppLanguageService() {
    return _languageService;
  }

  AppLanguageService._internal();

  changeLanguage(Language language) {
    this.language = language;
  }
}

enum Language {
  EN,
  BN,
}
