import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onremove;
  final String count;
  final String price;
  const PriceAndCountItems(
      {super.key,
      required this.onAdd,
      required this.onremove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(
        children: [
          IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
          Container(
              alignment: Alignment.center,
              width: 60,
              padding: const EdgeInsets.only(bottom: 5),
              // height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                count,
                style: const TextStyle(fontSize: 30, height: 1.1),
              )),
          IconButton(onPressed: onremove, icon: const Icon(Icons.remove)),
        ],
      ),
      const Spacer(),
      Text(
        "$price\$",
        style: const TextStyle(
            color: AppColor.primarycolor, fontSize: 30, height: 1.4),
      )
    ]);
  }
}
