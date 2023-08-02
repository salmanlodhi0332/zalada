import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/select_Address.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import '../../custom/botton_widget.dart';
import '../../utiles/getxcontroller.dart';
import '../../utiles/page_navigation.dart';
import '../../utiles/shimmer_custom.dart';
import '../controller/address_controller.dart';
import 'confirm_order.dart';

class Address_Screen extends StatefulWidget {
  Address_Screen({
    super.key,
  });

  @override
  State<Address_Screen> createState() => _Address_ScreenState();
}

class _Address_ScreenState extends State<Address_Screen> {
  final controller = Get.put(Address_Controller());
  final getcontroller = Get.put(getx_GetController());
  @override
  void initState() {
    super.initState();
    controller.getAddress();
  }

  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Custom_Appbar(
        title: "Address".tr,
        leadingButton: back_button(ontap: () {
          // Get.back();
        }),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Obx(() => controller.isLoading.value
              ? Column(
                  children: [
                    custom_shimmer(
                        width: size.width, height: size.height / 8.7),
                    custom_shimmer(
                        width: size.width, height: size.height / 8.7),
                    custom_shimmer(
                        width: size.width, height: size.height / 8.7),
                    custom_shimmer(
                        width: size.width, height: size.height / 8.7),
                    custom_shimmer(
                        width: size.width, height: size.height / 8.7),
                  ],
                )
              : Column(
                  children: controller.AddressList.map((e) {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedContainerIndex == e.id
                                    ? Theme.of(context)
                                        .indicatorColor
                                        .withOpacity(0.5)
                                    : Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.3),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              if (selectedContainerIndex == e.id) {
                                // getcontroller.selectedaddress.value = e.id!;

                                selectedContainerIndex = -1;
                                getcontroller.selectedaddress.value = 0;
                              } else {
                                selectedContainerIndex = e.id!;

                                getcontroller.selectedaddress.value = e.id!;
                              }
                            });
                            print(getcontroller.selectedaddress.value);
                          },
                          contentPadding: EdgeInsets.all(10),
                          title: Text(e.locationname,
                              style: TextStyle(
                                fontFamily: 'plusjakarta',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).hintColor,
                              )),
                          subtitle: Text(e.address,
                              style: TextStyle(
                                fontFamily: 'plusjakarta',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).hintColor,
                              )).py(10),
                          leading: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                            backgroundColor: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.1),
                          ),
                          trailing: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Theme.of(context).focusColor,
                              ),
                              onPressed: () {
                                Page_Navigation.getInstance.Page(
                                    context,
                                    Select_Address(
                                      id: e.id,
                                      userId: e.userid,
                                      address: e.address,
                                      latitude: e.latitude,
                                      longitude: e.longitude,
                                      address_type: e.addressType,
                                      locationName: e.locationname,
                                    ));
                              },
                            ),
                            backgroundColor: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.1),
                          ),
                        )).px(15).py(10);
                  }).toList(),
                ))),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.white70.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(1.0, 1.0), // soften the shadow
                spreadRadius: 0.0, //extend the shadow
              ),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          children: [
            Button_Widget(
                    ontap: () {
                      Page_Navigation.getInstance.Page(context, ConfirmOrder());
                    },
                    width: size.width / 1.5,
                    title: "continue".tr)
                .py(11),
            back_button(
              ontap: () {
                Page_Navigation.getInstance.Page(context, Select_Address());
              },
              pic: Icon(
                Icons.add,
                color: Theme.of(context).hoverColor,
              ).p(15),
            ),
          ],
        ),
      ),
    );
  }
}
