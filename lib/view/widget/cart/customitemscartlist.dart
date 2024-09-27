import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imageasset.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:flutter_application_1/linkapi.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagname;
  final void Function()? onadd;
  final void Function()? onremove;
  const CustomItemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagname,
      required this.onadd,
      required this.onremove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/$imagname",
                  height: 80,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    price,
                    style: const TextStyle(
                        color: AppColor.primarycolor, fontSize: 18),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child:
                      IconButton(onPressed: onadd, icon: const Icon(Icons.add)),
                ),
                SizedBox(
                    height: 30,
                    child: Text(
                      count,
                      style: const TextStyle(fontFamily: "sans"),
                    )),
                SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: onremove, icon: const Icon(Icons.remove)),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
