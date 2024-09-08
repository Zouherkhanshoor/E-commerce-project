import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return right(responsebody);
        } else {
          return left(StatusRequest.serverfailuer);
        }
      } else {
        return left(StatusRequest.offlinefailuer);
      }
    } catch (_) {
      return const Left(StatusRequest.serverExiption);
    }
  }
}
