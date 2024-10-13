import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/address/adddetails_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/functions/validinput.dart';
import 'package:flutter_application_1/core/shared/custombutton.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add details Address"),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CustomTextFormAuth(
                          hinttext: "City",
                          labeltext: "City",
                          iconData: Icons.location_city_outlined,
                          mycontroller: controller.city,
                          valid: (val) {
                            return validInput(val!, 3, 10, "City");
                          },
                          isNumber: false),
                      CustomTextFormAuth(
                          hinttext: "Street",
                          labeltext: "Street",
                          iconData: Icons.streetview,
                          mycontroller: controller.street,
                          valid: (val) {
                            return validInput(val!, 3, 10, "Street");
                          },
                          isNumber: false),
                      CustomTextFormAuth(
                          hinttext: "building",
                          labeltext: "building",
                          iconData: Icons.add_location_alt_rounded,
                          mycontroller: controller.name,
                          valid: (val) {
                            return validInput(val!, 3, 10, "building");
                          },
                          isNumber: false),
                      CustomButton(
                        text: "Add",
                        onPressed: () {
                          controller.addAddress();
                        },
                      )
                    ]),
                  )))),
    );
  }
}
