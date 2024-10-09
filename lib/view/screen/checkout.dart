import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/checkout_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imageasset.dart';
import 'package:flutter_application_1/view/widget/checkout/carddeliverytype.dart';
import 'package:flutter_application_1/view/widget/checkout/cardpaymentmethod.dart';
import 'package:flutter_application_1/view/widget/checkout/cardshippingaddress.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("CheckOut"),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secoundcolor,
            textColor: Colors.white,
            onPressed: () {},
            child: const Text(
              "CheckOut",
              style: TextStyle(),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const Text(
                          "choose payment method",
                          style: TextStyle(
                              color: AppColor.secoundcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("cash");
                          },
                          child: CardPaymentMethodCheckOut(
                            title: "Cash on velivery",
                            isActive: controller.paymentMethod == "cash"
                                ? true
                                : false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("card");
                          },
                          child: CardPaymentMethodCheckOut(
                            title: "Payment Card",
                            isActive: controller.paymentMethod == "card"
                                ? true
                                : false,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "choose Delivary type",
                          style: TextStyle(
                              color: AppColor.secoundcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.choosedeliverytype("delivery");
                              },
                              child: CardDeliveryTypeCheckOut(
                                title: "Delivery",
                                imagename: AppImageAsset.delivery,
                                active: controller.deliverytype == "delivery"
                                    ? true
                                    : false,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller.choosedeliverytype("Drivethru");
                              },
                              child: CardDeliveryTypeCheckOut(
                                title: "Drive thru",
                                imagename: AppImageAsset.drivethru,
                                active: controller.deliverytype == "Drivethru"
                                    ? true
                                    : false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (controller.deliverytype == "delivery")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: AppColor.secoundcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              ...List.generate(
                                controller.dataaddress.length,
                                (index) => InkWell(
                                  onTap: () {
                                    controller.chooseshippingAdress(controller
                                        .dataaddress[index].addressId!);
                                  },
                                  child: CardShippingAddressCheckOut(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    active: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false,
                                  ),
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                )));
  }
}
