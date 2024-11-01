// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/status_request.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/home_data.dart';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth_io.dart' as auth;

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
  goToMyFavorite();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;
  HomeData homeData = HomeData(Get.find());

  List categories = [];
  List items = [];

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    // getAccessToken();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getdata();
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoute.myFavorite);
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  // Future<String?> getAccessToken() async {
  //   final serviceAccountJson = {
  //     "type": "service_account",
  //     "project_id": "projectecommerce-7c191",
  //     "private_key_id": "fab0b0add2544a40e2b28e7ec8d8c0064d6613c5",
  //     "private_key":
  //         "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDmLHMfvRaOQb7x\nXURepDEH7NiznAO0bF21r5CbWjcvIgNNxsHYdaqMdZVF+gasHYyoPr0VJq/02WPF\nfj8EI1Rejo+ifuYb+YMg2bq5nt3/yhHWezbjr+0bKTznQA8GZfjk634HCnyQOlSj\nyMVYL3c6E7SA4wnNG2WHlEPPiT/CZBMJLUoTd5IRcxLYmp2dZn958LlOUBnb1vzJ\nLLJeVg0r7jWYsG5oKRBrsfKW29YgWT1uMw8mjUUH9FA46Vb2gh+2dmTMA5JB0zst\nACxzfLZJnbbrep8PP1sBbFqr4MTIEKlJmZd1osTxKbY+ZakIst23MsAU/Ux37+8n\nsTegnV/RAgMBAAECggEAAM7LIKNjPuCQMPyozsQ4v9Re9lJn2OxAb/DLyx/H7cxq\nwo0eBQp0rMWE3pgACf6Yjcaal0Zpe6x/oyPMSNFu7F4HtwRG/nYjtavN8fTSxqEI\n6v3HtYjahivg4Nbitp0JAJSq/o9U3JS301NTDfosqvGCwqkJUcT02EL28fWDWcVK\nb2YxvyLhgTTWx2X78XF+oGvXMyqkRsWP2QZzygHSa5Uv1AX9MCrsDdYU3axlPaVz\n7FwmopHpfUF23jwd1vEzd9CPT7/FrMqWbuDF45DBRBkumCweXYhoroN7pRC5+Uig\n3Fi1gKPwB7Voo5o95VUZmfIZLXKDobyeJ7hyHyCeoQKBgQD6zYmybIp6DSuXaMyl\nIfsexcdK7/EHMt3uBwMUFIGH/ZuWsdUbybGfqQgVm+x2EpLpqJa0kGZsqUwWemMl\nKaRJrxpThmSFCvsyPbifN683qMaojOwHLI0aJWXzpp+0/xSKnPCB+8/sNePKs/Ye\nqT4UUhME3oR7ORS+tWSPjGzHRQKBgQDq8Xo/WopuvKlyRKjcLiHWx60xJKthOdkz\n8s1xQVvV+49hc027Ehmysu4XIZnELmTbxYc2KrDL8IR4aNZANFWWkViWfksZ8Yr8\nLER40nXAdgu2C2Xs3WHgHGXyp1hkXXZk0vud/ckyKzO5cPfj4+m63+SaU8ETv7ED\njFf2d4npHQKBgQCHe771xtKrii/RNAjQ7+FjRz4YijOvStg+fEU6dLVgjCyfpGNW\nBofQkxRN8BQ12GTKmosG8baS3oW+4tBqQ+t+7nuPQVtNz5fRFSyFviQGMkNWzAG5\nAmUbCbbgf1NpCB7FnnACF9DDbn0mhD7hY1Wozol9qOLyWeyN9RlkvlwI7QKBgQC2\njM657zXk+T6IBQVXn5i3dAsERkPLldFI5f3vZCNhTseHprndAyFoklMhMgBySMIh\naYe39M/OhqHHlV30ITXneiPlO1hLXjzp19OUNaM82fwbhRu7QgDMzAQC2Th7M4vM\np4rOpeTw0FSuYDKcpfh0NYdAypcZKzb1VNT8MsG7mQKBgEfnwH1JYHFgKH7cg526\nIn0V4IvtaQABzqz18Gw9dc+ArgGC4HfX/yqtVZ8AkmcWApZnsqsSJumejugPnMw5\nSVwAshe0TesBK63V40Hun5bzinq7WrimYDeLICFRypoiFySeLFU99W1f9OdctWzZ\njarPk3WzYCqk0D/lxzMvPj1T\n-----END PRIVATE KEY-----\n",
  //     "client_email":
  //         "firebase-adminsdk-q8vxs@projectecommerce-7c191.iam.gserviceaccount.com",
  //     "client_id": "108557267171336367195",
  //     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  //     "token_uri": "https://oauth2.googleapis.com/token",
  //     "auth_provider_x509_cert_url":
  //         "https://www.googleapis.com/oauth2/v1/certs",
  //     "client_x509_cert_url":
  //         "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-q8vxs%40projectecommerce-7c191.iam.gserviceaccount.com",
  //     "universe_domain": "googleapis.com"
  //   };

  //   List<String> scopes = [
  //     "https://www.googleapis.com/auth/userinfo.email",
  //     "https://www.googleapis.com/auth/firebase.database",
  //     "https://www.googleapis.com/auth/firebase.messaging"
  //   ];

  //   try {
  //     http.Client client = await auth.clientViaServiceAccount(
  //         auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

  //     auth.AccessCredentials credentials =
  //         await auth.obtainAccessCredentialsViaServiceAccount(
  //             auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
  //             scopes,
  //             client);

  //     client.close();
  //     print(
  //         "Access Token: ${credentials.accessToken.data}"); // Print Access Token
  //     return credentials.accessToken.data;
  //   } catch (e) {
  //     print("Error getting access token: $e");
  //     return null;
  //   }
  // }

  // Map<String, dynamic> getBody({
  //   required String fcmToken,
  //   required String title,
  //   required String body,
  //   required String userId,
  //   String? type,
  // }) {
  //   return {
  //     "message": {
  //       "token":
  //           "fWBlQSW4TpSMMswvtV1LzV:APA91bFH-Dz_7pVUpzLiK9a6brtTyyjm8lPLy8m7d59JKggxvhKdJhp4XNpGGOUbzYeGs2ZXwsufdfI0CV7XLshNn62g2TYZwWv-tF3MfbhDqoLSVB36A3TsYFN11t6UToVMOa7cDGuf",
  //       "notification": {"title": title, "body": body},
  //       "android": {
  //         "notification": {
  //           "notification_priority": "PRIORITY_MAX",
  //           "sound": "default"
  //         }
  //       },
  //       "apns": {
  //         "payload": {
  //           "aps": {"content_available": true}
  //         }
  //       },
  //       "data": {
  //         "type": type,
  //         "id": userId,
  //         "click_action": "FLUTTER_NOTIFICATION_CLICK"
  //       }
  //     }
  //   };
  // }

  // Future<void> sendNotifications({
  //   required String fcmToken,
  //   required String title,
  //   required String body,
  //   required String userId,
  //   String? type,
  // }) async {
  //   try {
  //     var serverKeyAuthorization = await getAccessToken();

  //     // change your project id
  //     const String urlEndPoint =
  //         "https://fcm.googleapis.com/v1/projects/projectecommerce-7c191/messages:send";

  //     Dio dio = Dio();
  //     dio.options.headers['Content-Type'] = 'application/json';
  //     dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

  //     var response = await dio.post(
  //       urlEndPoint,
  //       data: getBody(
  //         userId: userId,
  //         fcmToken: fcmToken,
  //         title: title,
  //         body: body,
  //         type: type ?? "message",
  //       ),
  //     );

  //     // Print response status code and body for debugging
  //     print('Response Status Code: ${response.statusCode}');
  //     print('Response Data: ${response.data}');
  //   } catch (e) {
  //     print("Error sending notification: $e");
  //   }
  // }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;
  searchData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.searchData(search!.text);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
