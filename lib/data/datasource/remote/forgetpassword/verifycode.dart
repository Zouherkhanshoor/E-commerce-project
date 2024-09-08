import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
