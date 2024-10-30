import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingorders, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersid) async {
    var response = await crud.postData(AppLink.ordersdelete, {
      "ordersid": ordersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
