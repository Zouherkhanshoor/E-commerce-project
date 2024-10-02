import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/view/widget/cart/custom_button_navigationbar_cart.dart';
import 'package:flutter_application_1/view/widget/cart/customitemscartlist.dart';
import 'package:flutter_application_1/view/widget/cart/topcardcart.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          centerTitle: true,
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavigationBarCart(
                shipping: "0",
                controllercoupon: controller.controllercoupon!,
                onapplycoupon: () {
                  controller.checkCoupon();
                },
                price: "${cartcontroller.priceorders}",
                discount: "${cartcontroller.discountcoupon}%",
                totalprice: "${controller.gettotalprice()}")),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const SizedBox(height: 10),
                      TopCardCart(
                          message:
                              "You have ${cartcontroller.totalcountitems} Items in Your List "),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartcontroller.data.length,
                              (i) => CustomItemsCartList(
                                  onadd: () async {
                                    await cartcontroller
                                        .add(cartcontroller.data[i].itemsId!);
                                    cartcontroller.refreshpage();
                                  },
                                  onremove: () async {
                                    await cartcontroller.delete(
                                        cartcontroller.data[i].itemsId!);
                                    cartcontroller.refreshpage();
                                  },
                                  imagname:
                                      "${cartcontroller.data[i].itemsImage}",
                                  name: "${cartcontroller.data[i].itemsName}",
                                  price:
                                      "${cartcontroller.data[i].itemsprice}\$",
                                  count:
                                      "${cartcontroller.data[i].countitems}"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
