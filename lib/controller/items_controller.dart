import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/items_data.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  String? catid;
  int? selectedCat;

  ItemsData itemsData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    initialData();
    getItems(catid!);
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedcat"];
    catid = Get.arguments["catid"];
  }

  @override
  changeCat(int val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await itemsData.getData(categoryid.toString(),
        myServices.sharedPreferences.getString("id").toString());
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
