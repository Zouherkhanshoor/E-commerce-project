import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/constant/apptheme.dart';
import 'package:flutter_application_1/core/services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myservices = Get.find();

  ThemeData appTheme = themeEnglish;

  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myservices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
