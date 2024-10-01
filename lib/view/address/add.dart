import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/address/add_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Address"),
      ),
      body: Container(
          child: GetBuilder<AddAddressController>(
        builder: (controllerpage) => HandlingDataView(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.hybrid,
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlang) {
                            controllerpage.addmarkers(latlang);
                          },
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            child: MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                controllerpage.gotopageAddDetailsAddress();
                              },
                              color: AppColor.primarycolor,
                              textColor: Colors.white,
                              child: const Text(
                                "Continue",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            )),
      )),
    );
  }
}
