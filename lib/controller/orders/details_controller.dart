import 'dart:async';

import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/data/datasource/remote/orders/details_data.dart';
import 'package:flutter_application_1/data/model/cartmodel.dart';
import 'package:flutter_application_1/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;
  late OrdersModel ordersmodel;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? lang;
  CameraPosition? cameraPosition;

  intialData() {
    if (ordersmodel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersmodel.addressLat!),
            double.parse(ordersmodel.addressLang!)),
        zoom: 14.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(ordersmodel.addressLat!),
              double.parse(ordersmodel.addressLang!))));
    }
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await ordersDetailsData.getData(ordersmodel.ordersId!);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
