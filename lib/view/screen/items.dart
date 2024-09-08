import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/favorite_controller.dart';
import 'package:flutter_application_1/controller/items_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter_application_1/view/widget/items/customlistitems.dart';
import 'package:flutter_application_1/view/widget/items/listcategoriesitems.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:show_up_animation/show_up_animation.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleappbar: "Find Product",
              onPressedIcon: () {},
              onPressedsearch: () {},
            ),
            const SizedBox(height: 15),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.5),
                        itemBuilder: (BuildContext context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] ==
                              controller.data[index]['favorite'];
                          return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        })))
          ],
        ),
      ),
    );
  }
}
