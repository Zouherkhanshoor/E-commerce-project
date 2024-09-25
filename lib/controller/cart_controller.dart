import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/cart_data.dart';
import 'package:flutter_application_1/data/model/cartmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartdata = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<CartModel> data = [];

  int priceorders = 0;
  int totalcountitems = 0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;

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
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;

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

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshpage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartdata.viewCart(myServices.sharedPreferences.getString("id")!);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataresponse = response['datacart'];
        Map dataresponsecountprice = response['countprice'];
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        totalcountitems = dataresponsecountprice['totalcount'];
        priceorders = dataresponsecountprice['totalprice'];
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
