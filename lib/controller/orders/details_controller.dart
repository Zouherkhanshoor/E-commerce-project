import 'package:flutter_application_1/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersmodel;

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    super.onInit();
  }
}
