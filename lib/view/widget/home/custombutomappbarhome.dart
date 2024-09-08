import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/homescreen_controller.dart';
import 'package:flutter_application_1/view/widget/home/custombottomappbar.dart';

class CustomBotomAppBarHome extends StatelessWidget {
  const CustomBotomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listpage.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtomAppBar(
                            onPressed: () {
                              controller.changePage(i);
                            },
                            textbutton: controller.titlebuttonappbar[i],
                            icondata: Icons.home,
                            active: controller.currentpage == i ? true : false);
                  })),
                ],
              ),
            ));
  }
}
