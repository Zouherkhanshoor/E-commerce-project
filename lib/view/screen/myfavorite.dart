import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/myfavorite_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/view/screen/home.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter_application_1/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyfavoriteController>(
            builder: (controller) => ListView(
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
                const SizedBox(height: 10),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return CustomListFavoriteItems(
                                  itemsModel: controller.data[index]);
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.5),
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata))
              ],
            ),
          )),
    );
  }
}
