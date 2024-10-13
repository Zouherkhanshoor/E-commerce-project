import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/orders/pending_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => CardOrdersList(
                              listdata: controller.data[index],
                            )),
                  ))),
    );
  }
}

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Orders Number : #${listdata.ordersId}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text(
                "Order type : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order price : ${listdata.ordersPrice} \$"),
            Text("delivery price : ${listdata.ordersPricedelivery} \$"),
            Text(
                "payment method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            Text(
                "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            Divider(),
            Row(
              children: [
                Text(
                  "Total price : ${listdata.ordersTotalprice} \$",
                  style: TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {},
                  child: Text("Details"),
                  color: AppColor.thirdcolor,
                  textColor: AppColor.secoundcolor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
