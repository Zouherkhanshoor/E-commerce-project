import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/screen/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomescreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Favorite"),
        )
      ],
    )
  ];

  List titlebuttonappbar = ["home", "setting", "profile", "favorite"];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
