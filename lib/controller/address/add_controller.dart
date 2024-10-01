import 'dart:async';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? lang;

  addmarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    lang = latLng.longitude;
    update();
  }

  gotopageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails, arguments: {
      "lat": lat.toString(),
      "lang": lang.toString(),
    });
  }

  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
