import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getdata() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
