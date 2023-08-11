import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../custom/back_button.dart';
import '../../custom/custom_appbar.dart';
import '../../utiles/shimmer_custom.dart';
import '../controller/order_controller.dart';

class All_Orders extends StatefulWidget {
  const All_Orders({super.key});

  @override
  State<All_Orders> createState() => _All_OrdersState();
}

class _All_OrdersState extends State<All_Orders> {
  RxBool showshimmer = true.obs;

  final controller = Get.put(Order_Controller());

  @override
  void initState() {
    super.initState();
    controller.getAllOrders();
    Timer(Duration(seconds: 3), () {
      showshimmer.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Custom_Appbar(
        title: "All Orders",
        leadingButton: back_button(
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Obx(() => controller.orderList.isEmpty
              ? Column(
                  children: showshimmer.value
                      ? [
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
                          SizedBox(height: 10),
                        ]
                      : [
                          Center(
                            child: Text(
                              "No Orders Available",
                              style: TextStyle(
                                fontFamily: 'plusjakarta',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).hintColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ])
              : Column(
                  children: controller.orderList.map((e) {
                    return Container(
                        child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text(e.total_payment,
                          style: TextStyle(
                            fontFamily: 'plusjakarta',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).hintColor,
                          )),
                      subtitle: Text(e.status,
                          style: TextStyle(
                            fontFamily: 'plusjakarta',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).hintColor,
                          )).py(10),
                      // leading: Padding(
                      //   padding: const EdgeInsets.only(right: 25, left: 10),
                      //   child: Image.asset("assets/images/mastercard.png"),
                      // ),
                    )).px(15).py(10);
                  }).toList(),
                ))),
    );
  }
}
