import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/settings_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imageasset.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return SizedBox(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primarycolor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    // onTap: () {},
                    title: const Text("Disable Notifications"),
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.orderspending);
                    },
                    title: const Text("Orders"),
                    trailing: const Icon(Icons.card_travel_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    title: const Text("Archive"),
                    trailing: const Icon(Icons.archive_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: const Text("Address"),
                    trailing: const Icon(Icons.house_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {},
                    title: const Text("About Us"),
                    trailing: const Icon(Icons.help_outline_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("https://wa.me/+963949636289"));
                      // await launchUrl(Uri.parse("tel:+963949636289"));
                    },
                    title: const Text("Contact Us"),
                    trailing: const Icon(Icons.wifi_calling_3),
                  ),
                  const Divider(),
                  ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: const Text("Log out"),
                      trailing: const Icon(Icons.logout_outlined)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
