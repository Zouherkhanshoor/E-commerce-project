import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/favorite_controller.dart';
import 'package:flutter_application_1/controller/items_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/functions/translatedatabase.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:flutter_application_1/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage!}",
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  translateDataBase(
                      itemsModel.itemsNameAr, itemsModel.itemsName),
                  style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rating 3.5 ",
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 12,
                                    ))
                          ],
                        ),
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsModel.itemsPrice}\$",
                      style: const TextStyle(
                          color: AppColor.primarycolor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans"),
                    ),
                    GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.setFavorite(itemsModel.itemsId, "0");
                                controller.removeFavorite(itemsModel.itemsId!);
                              } else {
                                controller.setFavorite(itemsModel.itemsId, "1");
                                controller.addFavorite(itemsModel.itemsId!);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.primarycolor,
                            )))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
