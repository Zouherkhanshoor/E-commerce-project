import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/productdetailscontroller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/linkapi.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColor.secoundcolor,
          ),
          height: 170,
        ),
        Positioned(
          top: 15.0,
          right: Get.width / 6,
          left: Get.width / 6,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
              height: 350,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
