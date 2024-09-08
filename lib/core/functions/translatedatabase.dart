import 'package:get/get.dart';
import 'package:flutter_application_1/core/services/services.dart';

translateDataBase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
