import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await testData.getData();
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
  void onInit() {
    getData();
    super.onInit();
  }
}
