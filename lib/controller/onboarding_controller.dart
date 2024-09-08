import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/static/static.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnBordingController {
  late PageController pageController;
  int currentpage = 0;

  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;

    if (currentpage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
