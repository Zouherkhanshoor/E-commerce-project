import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/auth/successsignup_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 2.5,
        title: Text("32".tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primarycolor,
              ),
            ),
            Text("37".tr, style: Theme.of(context).textTheme.headlineLarge),
            Text("38".tr),
            const Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
