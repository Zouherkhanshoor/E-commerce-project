import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
