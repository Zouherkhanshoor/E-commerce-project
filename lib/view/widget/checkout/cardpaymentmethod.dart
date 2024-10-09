import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class CardPaymentMethodCheckOut extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckOut(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.secoundcolor : AppColor.thirdcolor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true ? Colors.white : AppColor.secoundcolor,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
