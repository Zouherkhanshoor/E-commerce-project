import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/homecontroller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/functions/translatedatabase.dart';
import 'package:flutter_application_1/data/model/categoriesmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.goToItems(controller.categories, i!,
                categoriesModel.categoiresId.toString());
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.thirdcolor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageCategories}/${categoriesModel.categoiresImage}",
              width: 90,
              height: 90,
            ),
          ),
        ),
        Text(
          "${translateDataBase(categoriesModel.categoiresNameAr, categoriesModel.categoiresName)}",
          style: const TextStyle(color: AppColor.grey2),
        ),
      ],
    );
  }
}
