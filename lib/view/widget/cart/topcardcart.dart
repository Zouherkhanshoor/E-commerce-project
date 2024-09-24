import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(horizontal: 20),
      // height: 20,
      decoration: BoxDecoration(
          color: AppColor.thirdcolor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColor.secoundcolor),
      ),
    );
  }
}
