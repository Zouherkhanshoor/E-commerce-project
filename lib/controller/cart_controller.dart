import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/cart_data.dart';
import 'package:flutter_application_1/data/model/cartmodel.dart';
import 'package:flutter_application_1/data/model/couponmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  CartData cartdata = CartData(Get.find());
  int discountcoupon = 0;
  String? couponname;

  late StatusRequest statusRequest;
  CouponModel? couponModel;
  MyServices myServices = Get.find();

  List<CartModel> data = [];

  int priceorders = 0;
  int totalcountitems = 0;

  gettotalprice() {
    return (priceorders - priceorders * discountcoupon / 100);
  }

  add(String itemsid) async {
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

  delete(String itemsid) async {
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

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.checkcoupon(controllercoupon!.text);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel!.couponDiscount!;
        couponname = couponModel!.couponName;
      } else {
        // statusRequest = StatusRequest.failuer;
        discountcoupon = 0;
        couponname = null;
      }
    }
    update();
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
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = dataresponsecountprice['totalcount'];
          priceorders = dataresponsecountprice['totalprice'];
          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponModel = CouponModel();
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
