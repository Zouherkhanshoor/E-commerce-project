import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:flutter_application_1/linkapi.dart';
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
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCardHome(
                                title: "A summer surprise",
                                body: "Cashback 20%"),
                            CustomTitleHome(title: "Categories"),
                            ListCategoriesHome(),
                            CustomTitleHome(title: "Product for you"),
                            ListItemsHome(),
                          ],
                        )
                      : ListItemsSearch(listdatamodel: controller.listdata))

              // const CustomTitleHome(title: "Offer For you"),
              // const ListItemsHome(),
            ],
          )),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.imageItems}/${listdatamodel[index].itemsImage}")),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdatamodel[index].itemsName!),
                            subtitle:
                                Text(listdatamodel[index].categoiresName!),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}





// https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/star.svg