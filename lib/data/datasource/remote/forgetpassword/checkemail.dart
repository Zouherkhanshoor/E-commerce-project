import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postdata(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
