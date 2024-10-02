import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class CustomButtomCoupon extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  const CustomButtomCoupon(
      {super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.white,
        color: AppColor.primarycolor,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}
