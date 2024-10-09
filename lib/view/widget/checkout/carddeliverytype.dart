import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imageasset.dart';
import 'package:get/get.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;
  const CardDeliveryTypeCheckOut(
      {super.key,
      required this.imagename,
      required this.title,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          color: active ? AppColor.secoundcolor : null,
          border: Border.all(color: AppColor.secoundcolor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: Get.width / 8,
            color: active ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: active ? Colors.white : AppColor.secoundcolor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
