import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/notification_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Container(
        child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        const Center(
                            child: Text(
                          "Notification",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primarycolor),
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                            controller.data.length,
                            (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        title: Text(controller.data[index]
                                            ['notification_title']),
                                        subtitle: Text(controller.data[index]
                                            ['notification_body']),
                                      ),
                                      Positioned(
                                        right: 5,
                                        child: Text(
                                          Jiffy.parse(controller.data[index]
                                                  ['notification_datetime'])
                                              .fromNow(),
                                          style: const TextStyle(
                                              color: AppColor.primarycolor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                      ],
                    ),
                  ),
                )));
  }
}
