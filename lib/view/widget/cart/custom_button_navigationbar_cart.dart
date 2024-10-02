// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/view/widget/cart/butttoncart.dart';
import 'package:flutter_application_1/view/widget/cart/custombuttoncoupon.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onapplycoupon;
  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      required this.onapplycoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: controllercoupon,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  hintText: "coupon code",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomButtomCoupon(
                                textbutton: "apply",
                                onPressed: onapplycoupon,
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        "Coupon code ${controller.couponname!}",
                        style: TextStyle(
                            color: AppColor.primarycolor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primarycolor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Price",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$price \$",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ]),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "discount",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$discount",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ]),
                SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "shipping",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$shipping",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ]),
                SizedBox(height: 10),
                Divider(color: Colors.black),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Total price ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primarycolor),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$totalprice \$",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primarycolor),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomButtomCart(
            textbutton: " Order",
            onPressed: () {
              Get.toNamed(AppRoute.checkout);
            },
          )
        ],
      ),
    );
  }
}
