import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/homecontroller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CachedNetworkImage(
            imageUrl: "${AppLink.imageItems}/${itemsModel.categoiresImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30)),
          height: 110,
          width: 200,
        ),
        Positioned(
            left: 20,
            child: Text(
              "${itemsModel.categoiresName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ))
      ],
    );
  }
}
