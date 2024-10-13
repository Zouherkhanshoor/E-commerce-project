import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/address_data.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AddressdData addressdData = AddressdData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? lang;

  initalData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    lang = Get.arguments['lang'];

    print(lat);
    print(lang);
  }

  addAddress() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressdData.addData(
          myServices.sharedPreferences.getString("id")!,
          name!.text,
          city!.text,
          street!.text,
          lat!,
          lang!);
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.homepage);
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
