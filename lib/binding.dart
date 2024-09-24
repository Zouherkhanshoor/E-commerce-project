import 'package:get/get.dart';
import 'package:flutter_application_1/controller/auth/signup_controller.dart';
import 'package:flutter_application_1/core/class/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(Crud());
    // Get.lazyPut<ItemsControllerImp>(() => ItemsControllerImp());
  }
}
