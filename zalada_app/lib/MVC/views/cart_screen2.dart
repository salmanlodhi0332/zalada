import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/edit_btn.dart';

import '../../custom/botton_widget.dart';
import '../../custom/product_card.dart';
import 'cart_products.dart';

class CartScreenWithData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final ph = 20.0;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'cart'.tr,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        centerTitle: true,
        leading: back_button(
          ontap: () {
            Get.back();
          },
        ),
        actions: [
          edit_button(
            ontap: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Column(
                children: [
                  CartProducts(),
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
                  CartProducts(),
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
                  CartProducts(),
                ],
              ),
              Divider(
                color: Theme.of(context).disabledColor.withOpacity(0.4),
                thickness: 4,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'product_related'.tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ).pOnly(bottom: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Product_Card(
                        imageurl:
                            'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).pOnly(bottom: 25, top: 40),
                      const Product_Card(
                        imageurl:
                            'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).px(10),
                      const Product_Card(
                        imageurl:
                            'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).py(25),
                      const Product_Card(
                        imageurl:
                            'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).px(10),
                    ],
                  ),
                )
              ]).px(ph).py(10),
              Button_Widget(width: width, title: 'checkout'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
