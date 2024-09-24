// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/cart/butttoncart.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$shipping",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "300 \$",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ]),
          Divider(color: Colors.black),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          const SizedBox(height: 12),
          CustomButtomCart(
            textbutton: "Plase Order",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
