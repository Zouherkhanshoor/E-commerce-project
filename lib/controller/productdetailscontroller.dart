import 'package:get/get.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  initialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  List subitems = [
    {"name": "Red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "Black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
