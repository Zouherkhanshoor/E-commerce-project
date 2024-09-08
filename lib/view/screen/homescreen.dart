import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/homescreen_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/home/custombutomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerImp());
    return GetBuilder<HomescreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColor.primarycolor,
              onPressed: () {},
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBotomAppBarHome(),
            body: controller.listpage.elementAt(controller.currentpage)));
  }
}
