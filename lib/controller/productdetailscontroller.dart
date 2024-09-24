import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countitems = 0;

  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await cartController.getcountitems(itemsModel.itemsId!);

    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "Red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "Black", "id": 3, "active": '1'}
  ];

  add() {
    cartController.add(itemsModel.itemsId!);
    countitems++;
    update();
  }

  delete() {
    if (countitems > 0) {
      cartController.delete(itemsModel.itemsId!);
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
