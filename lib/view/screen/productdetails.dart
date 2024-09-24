import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/productdetailscontroller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/productdetails/priceandcount.dart';
import 'package:flutter_application_1/view/widget/productdetails/subitemalist.dart';
import 'package:flutter_application_1/view/widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.secoundcolor,
            onPressed: () {},
            child: const Text(
              "Add to Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const TopProductPageDetails(),
                      const SizedBox(height: 170),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: AppColor.fourthcolor),
                            ),
                            const SizedBox(height: 10),
                            PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onremove: () {
                                controller.delete();
                              },
                              price: "${controller.itemsModel.itemsPrice}",
                              count: "${controller.countitems}",
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                              style: Theme.of(context).textTheme.bodyMedium!,
                            ),
                            const SizedBox(height: 10),
                            // Text(
                            //   "Color",
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .headlineLarge!
                            //       .copyWith(color: AppColor.fourthcolor),
                            // ),
                            // const SizedBox(height: 10),
                            // const SubItemsList(),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
