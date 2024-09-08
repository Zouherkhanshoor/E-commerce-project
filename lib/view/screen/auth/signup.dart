import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/auth/signup_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/functions/alertexitapp.dart';
import 'package:flutter_application_1/core/functions/validinput.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter_application_1/view/widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 2.5,
          title: Text("17".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColor.grey)),
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (didPop) {
                return;
              } else {
                alertExitApp();
              }
            },
            child: GetBuilder<SignUpControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            CustomTextTitleAuth(
                              text: '10'.tr,
                            ),
                            const SizedBox(height: 15),
                            CustomTextBodyAuth(
                              text: "24".tr,
                            ),
                            const SizedBox(height: 35),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 100, "username");
                              },
                              mycontroller: controller.username,
                              hinttext: "23".tr,
                              iconData: Icons.person_outline,
                              labeltext: "20".tr,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 100, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "12".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "18".tr,
                            ),
                            CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 3, 100, "phone");
                              },
                              mycontroller: controller.phone,
                              hinttext: "22".tr,
                              iconData: Icons.phone_android_outlined,
                              labeltext: "21".tr,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 100, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              iconData: Icons.lock_outlined,
                              labeltext: "19".tr,
                            ),
                            CustomButtonAuth(
                              text: "17".tr,
                              onPressed: () {
                                controller.signup();
                              },
                            ),
                            const SizedBox(height: 30),
                            CustomTextSignUpOrSignIn(
                              onTap: () {
                                controller.goToSignIn();
                              },
                              textone: "25".tr,
                              texttwo: "26".tr,
                            ),
                          ],
                        ),
                      ),
                    )))));
  }
}
