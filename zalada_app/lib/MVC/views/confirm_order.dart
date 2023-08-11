import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/shiping_controller.dart';
import 'package:zalada_app/MVC/views/Address_Screen.dart';
import 'package:zalada_app/MVC/views/select_Address.dart';
import 'package:zalada_app/auth/order_successful_bottom_bar.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import 'cart_products.dart';
import 'order_items.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final controller = Get.put(Shiping_Controller());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Custom_Appbar(
        title: "Order",
        leadingButton: back_button(
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "address".tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ).px(20),
                    TextButton(
                            onPressed: () {
                              Page_Navigation.getInstance
                                  .Page(context, Address_Screen());
                            },
                            child: Text("edit".tr,
                                style: TextStyle(
                                    color: Theme.of(context).focusColor,
                                    fontFamily: 'plusjakarta',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)))
                        .pOnly(right: 20)
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Icon(Icons.home),
                    ),
                    Text(
                      "home".tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Jl. Pangkur, Ngabean Wetan, Sinduharjo, Kec. Ngaglik, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ).px(20),
                SizedBox(height: 20),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.4),
                  thickness: 4,
                ),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
            Container(
                child: Column(children: [
              Row(
                children: [
                  Text(
                    "item".tr,
                    style: TextStyle(
                        fontFamily: 'plusjakarta',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ).px(20),
                ],
              ),
              Wrap(children: [
                Column(
                  children: [
                    OrderItems(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: Theme.of(context).disabledColor.withOpacity(0.4),
                    thickness: 1,
                  ),
                ),
                Column(
                  children: [
                    OrderItems(),
                  ],
                ),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.4),
                  thickness: 4,
                ),
                SizedBox(
                  height: 30,
                )
              ]),
            ])),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "shiping".tr,
                        style: TextStyle(
                            fontFamily: 'plusjakarta',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ).px(20),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Column(
                        children: controller.shipingList.map((ship) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.4), // Border color
                                  width: 1.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    12.0), // Border radius
                              ),
                              child: Column(children: [
                                ListTile(
                                  leading:
                                      // Image.asset(
                                      //     "assets/images/Rectangle14.png"),
                                      // '${ship.image}').px(25),
                                      Image.network(
                                    '${ship.image}',
                                    height: 45,
                                  ),
                                  title: Text(
                                    '${ship.name} ',
                                    // "J&T Express",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'plusjakarta',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.navigate_next_outlined)),
                                ),
                                Divider(
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.4),
                                  thickness: 1,
                                ),
                                ListTile(
                                  title: Text(
                                          // "Regular (\$8)",
                                          '${ship.type} (${ship.charges})',
                                          style: TextStyle(
                                              fontFamily: 'plusjakarta',
                                              //fontSize: 18,
                                              fontWeight: FontWeight.w700))
                                      .px(25),
                                  subtitle: Text(
                                      // "Estimate time 01 - 03 November"
                                      '${ship.estimated_time}').px(25),
                                ),
                              ]),
                            ),
                          );
                        }).toList(),
                      )),
                  Divider(
                    color: Theme.of(context).disabledColor.withOpacity(0.4),
                    thickness: 4,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Container(
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "payment_summary".tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ).px(20),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "price".tr,
                      style: TextStyle(
                        fontFamily: 'plusjakarta',
                        fontSize: 18,
                      ),
                    ).px(20),
                    Text(
                      "\$4.53",
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ).pOnly(right: 20),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "delivery_fee".tr,
                      style: TextStyle(
                        fontFamily: 'plusjakarta',
                        fontSize: 18,
                      ),
                    ).px(20),
                    Text(
                      "\$1.0",
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ).pOnly(right: 20),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: Theme.of(context).disabledColor.withOpacity(0.4),
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "total_payment".tr,
                      style: TextStyle(
                        fontFamily: 'plusjakarta',
                        fontSize: 18,
                      ),
                    ).px(20),
                    Text(
                      "\$5.53",
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ).pOnly(right: 20),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.4),
                  thickness: 4,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "payment_method".tr,
                            style: TextStyle(
                                fontFamily: 'plusjakarta',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ).px(20),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.4), // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(12.0), // Border radius
                          ),
                          child: Column(children: [
                            ListTile(
                              leading:
                                  Image.asset("assets/images/mastercard.png")
                                      .px(25),
                              title: Text(
                                "master_card".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'plusjakarta',
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                "**** **** 07837873",
                                style: TextStyle(fontSize: 16),
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.navigate_next_outlined)),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Button_Widget(
                    ontap: () {
                      Get.bottomSheet(
                        Order_successful_Bottom_Bar(),
                        isScrollControlled: true,
                      );
                    },
                    width: width,
                    title: 'Pay \$1248'),
                SizedBox(
                  height: 20,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
