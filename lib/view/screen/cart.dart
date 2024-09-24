import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widget/cart/appbarcart.dart';
import 'package:flutter_application_1/view/widget/cart/custom_button_navigationbar_cart.dart';
import 'package:flutter_application_1/view/widget/cart/customitemscartlist.dart';
import 'package:flutter_application_1/view/widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarCart(
          price: "1200", shipping: "300", totalprice: "1500"),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: ListView(
        children: [
          const TopAppBarCart(title: "My Cart"),
          const SizedBox(height: 10),
          const TopCardCart(message: "You have 2 Items in Your List "),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Column(
              children: [
                CustomItemsCartList(
                    name: "Macbook M2 Max", price: "2100,00 \$", count: "2"),
                CustomItemsCartList(
                    name: "Macbook M1", price: "1500,00 \$", count: "1"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
