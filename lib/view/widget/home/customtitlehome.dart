import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            color: AppColor.primarycolor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
