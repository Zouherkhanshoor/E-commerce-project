import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imageasset.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  const CustomItemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  AppImageAsset.logo,
                  height: 90,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    price,
                    style:
                        TextStyle(color: AppColor.primarycolor, fontSize: 18),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ),
                SizedBox(
                    height: 30,
                    child: Text(
                      count,
                      style: TextStyle(fontFamily: "sans"),
                    )),
                SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.remove)),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
