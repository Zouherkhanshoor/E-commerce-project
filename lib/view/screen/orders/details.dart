import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/orders/details_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView(
          children: [
            Table(
              children: const [
                TableRow(children: [
                  Text(
                    "Item",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "QTY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Price",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                TableRow(children: [
                  Text("mac book", textAlign: TextAlign.center),
                  Text("5", textAlign: TextAlign.center),
                  Text("1200", textAlign: TextAlign.center),
                ]),
                TableRow(children: [
                  Text("S22 Ultra", textAlign: TextAlign.center),
                  Text("6", textAlign: TextAlign.center),
                  Text("3500", textAlign: TextAlign.center),
                ])
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                child: const Text(
              "price : 2500 \$",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.primarycolor, fontWeight: FontWeight.bold),
            )),
            Card(
              child: Container(
                child: const ListTile(
                  title: Text("Shipping Address"),
                  subtitle: Text("Damascus Street one "),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
