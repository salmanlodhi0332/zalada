import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/edit_btn.dart';
import 'package:zalada_app/views/cart_products.dart';

import '../../custom/botton_widget.dart';
import '../../custom/product_card.dart';
import 'onboarding/onboard_two.dart';

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
                        imageurl: 'assets/images/item.png',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).py(25),
                      const Product_Card(
                        imageurl: 'assets/images/item.png',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).py(25).px(15),
                      const Product_Card(
                        imageurl: 'assets/images/item.png',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).py(25),
                      const Product_Card(
                        imageurl: 'assets/images/item.png',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).py(25).px(15),
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
