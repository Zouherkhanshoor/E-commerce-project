import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.favoriteDelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
