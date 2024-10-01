import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class AddressdData {
  Crud crud;

  AddressdData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String lang) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": lang,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
