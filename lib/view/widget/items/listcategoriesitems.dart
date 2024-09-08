import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/items_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/functions/translatedatabase.dart';
import 'package:flutter_application_1/data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return SizedBox(
      height: 100,
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

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // controller.goToItems(controller.categories, i!);
          controller.changeCat(i!, categoriesModel.categoiresId.toString());
        },
        child: Column(
          children: [
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
                decoration: controller.selectedCat == i
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: AppColor.primarycolor)))
                    : null,
                child: Text(
                  "${translateDataBase(categoriesModel.categoiresNameAr, categoriesModel.categoiresName)}",
                  style: const TextStyle(fontSize: 20, color: AppColor.grey2),
                ),
              ),
            ),
          ],
        ));
  }
}
