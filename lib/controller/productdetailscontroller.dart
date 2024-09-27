import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/cart_data.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  CartData cartdata = CartData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  int countitems = 0;

  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getcountitems(itemsModel.itemsId!);

    statusRequest = StatusRequest.success;
    update();
  }

  getcountitems(String itemsid) async {
    statusRequest = StatusRequest.loading;

    var response = await cartdata.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response["data"];
        print("=======================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  additems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text(" تم اضافة المنتج الى السلة"),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text(" تم ازالة المنتج من السلة"),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  List subitems = [
    {"name": "Red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "Black", "id": 3, "active": '1'}
  ];

  add() {
    additems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  delete() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() async {
    initialData();
    super.onInit();
  }
}
