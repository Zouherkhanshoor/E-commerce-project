import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          username.text, password.text, email.text, phone.text);
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warnning",
              middleText: "phone number or email already exists");
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
