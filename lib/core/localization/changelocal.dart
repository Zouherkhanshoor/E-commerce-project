import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  requestperlocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("warning", "please turn on location service");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "warning", "please give permission location service on ");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
          "warning", "you can't use these app without permission ");
    }
  }

  @override
  void onInit() {
    requestperlocation();
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
