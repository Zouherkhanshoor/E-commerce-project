import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/homecontroller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter_application_1/view/widget/home/customcardhome.dart';
import 'package:flutter_application_1/view/widget/home/customtitlehome.dart';
import 'package:flutter_application_1/view/widget/home/listcategorieshome.dart';
import 'package:flutter_application_1/view/widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
                        onPressedIconFavorite: () {
                          controller.goToMyFavorite();
                          // Get.toNamed(AppRoute.myFavorite);
                        },
                        titleappbar: "Find Product",
                        // onPressedIcon: () {},
                        onPressedsearch: () {},
                      ),
                      const CustomCardHome(
                          title: "A summer surprise", body: "Cashback 20%"),
                      const CustomTitleHome(title: "Categories"),
                      const ListCategoriesHome(),
                      const CustomTitleHome(title: "Product for you"),
                      const ListItemsHome(),
                      // const CustomTitleHome(title: "Offer For you"),
                      // const ListItemsHome(),
                    ],
                  )),
            ));
  }
}





// https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/star.svg