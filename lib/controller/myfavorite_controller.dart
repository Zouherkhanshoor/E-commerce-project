import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/homecontroller.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/data/datasource/remote/myfavorite_data.dart';
import 'package:flutter_application_1/data/model/myfavorite.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';

class MyfavoriteController extends SearchMixController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];

        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));

        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    var response = favoriteData.deleteData(favoriteid);
    // print("===============================controller $response ");
    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);

    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  goToMyFavorite() {
    Get.toNamed(AppRoute.myFavorite);
  }
}
