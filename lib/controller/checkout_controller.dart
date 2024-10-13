import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/address_data.dart';
import 'package:flutter_application_1/data/datasource/remote/checkout_data.dart';
import 'package:flutter_application_1/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressdData addressdData = Get.put(AddressdData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? deliverytype;
  String addressid = "0";

  late String couponid;
  late String discountcoupon;
  late String priceorders;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  choosedeliverytype(String val) {
    deliverytype = val;
    update();
  }

  chooseshippingAdress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressdData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar("Error", "please choose paymentmethod");
    if (deliverytype == null)
      return Get.snackbar("Error", "please choose delivery type");
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliverytype.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "discountcoupon": discountcoupon.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "the orders Done");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("wrong", "please try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorders'];
    discountcoupon = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
