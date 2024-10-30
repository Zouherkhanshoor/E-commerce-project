import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/offers.dart';
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
    const NotificationView(),
    const OffersView(),
    const Settings(),
  ];

  List buttonappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notification", "icon": Icons.notifications_active_outlined},
    {"title": "offers", "icon": Icons.offline_bolt_sharp},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
