import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/localization/changelocal.dart';
import 'package:flutter_application_1/view/widget/language/custombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            CustomButtomLang(
              textbutton: "Arabic",
              onPressed: () {
                controller.changelang("ar");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
            CustomButtomLang(
              textbutton: "English",
              onPressed: () {
                controller.changelang("en");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
