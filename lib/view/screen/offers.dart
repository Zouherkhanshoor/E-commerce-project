import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/favorite_controller.dart';
import 'package:flutter_application_1/controller/offers_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/view/screen/home.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter_application_1/view/widget/offers/customitemsoffers.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    onPressedIconFavorite: () {
                      controller.goToMyFavorite();
                    },
                    titleappbar: "Find Product",
                    // onPressedIcon: () {},
                    onPressedsearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  SizedBox(height: 15),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) =>
                                  CustomListItemsOffers(
                                      itemsModel: controller.data[index])))
                      : ListItemsSearch(listdatamodel: controller.listdata)
                ],
              ),
            ));
  }
}
