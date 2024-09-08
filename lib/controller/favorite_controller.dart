import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id").toString(),
        itemsid.toString());
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("اشعار", " تم اضافة المنتج للمفضلة");
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!.toString(),
        itemsid.toString());
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("اشعار", " تم حذف المنتج من المفضلة");
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
