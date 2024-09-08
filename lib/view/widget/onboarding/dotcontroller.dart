import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (i) => AnimatedContainer(
                          margin: const EdgeInsets.all(1),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == i ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primarycolor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
