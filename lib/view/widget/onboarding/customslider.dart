import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(children: [
              // const SizedBox(height: 25),
              // const SizedBox(height: 40),
              Image.asset(
                onBoardingList[i].image!,
                // width: 250,
                height: Get.width / 1.2,
                fit: BoxFit.fill,
              ),
              Text(
                onBoardingList[i].title!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 40),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        height: 2, color: AppColor.grey, fontSize: 17),
                  )),
            ]));
  }
}
