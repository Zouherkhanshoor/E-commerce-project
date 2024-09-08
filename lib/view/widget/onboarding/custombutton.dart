import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primarycolor,
        textColor: Colors.white,
        child: Text("8".tr),
      ),
    );
  }
}
