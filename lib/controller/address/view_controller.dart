import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/address_data.dart';
import 'package:flutter_application_1/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressdData addressdData = AddressdData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  deleteAddress(String addressid) {
    addressdData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await addressdData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
