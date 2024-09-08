import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/onboarding/custombutton.dart';
import 'package:flutter_application_1/view/widget/onboarding/customslider.dart';
import 'package:flutter_application_1/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(
                      flex: 3,
                    ),
                    CustomButtonOnBoarding(),
                  ],
                ))
          ],
        )));
  }
}
