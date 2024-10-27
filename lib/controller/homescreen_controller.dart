import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/settings.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/screen/home.dart';

import '../view/screen/notification.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomescreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const HomePage(),
    NotificationView(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Settings(),
  ];

  List buttonappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "ca", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_rounded},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
