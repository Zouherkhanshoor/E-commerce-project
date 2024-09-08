import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/crud.dart';

class IntialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
