import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class CardShippingAddressCheckOut extends StatelessWidget {
  final String title;
  final String body;
  final bool active;
  const CardShippingAddressCheckOut(
      {super.key,
      required this.title,
      required this.body,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: active ? AppColor.secoundcolor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: active ? Colors.white : null, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          body,
          style: TextStyle(
              color: active ? Colors.white : null, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
