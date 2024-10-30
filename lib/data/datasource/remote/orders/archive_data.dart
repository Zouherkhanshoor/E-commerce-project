import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersarchive, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
