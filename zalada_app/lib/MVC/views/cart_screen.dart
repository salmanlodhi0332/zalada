import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/edit_btn.dart';

import '../../custom/botton_widget.dart';
import '../../custom/product_card.dart';

class CartScreen extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.start,
                //  / crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Image.asset('assets/images/empty_cart.png'),
                  ).pOnly(bottom: 10),
                  Text(
                    'cart_heading_one'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                        fontSize: 25),
                  ).pOnly(bottom: 10),
                  Text(
                    'cart_description'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).disabledColor,
                        fontSize: 15),
                  ).pOnly(bottom: 10).px(40),
                  SizedBox(
                    height: 20,
                  ),
                  Button_Widget(width: width, title: 'start_Shopping'.tr),
                  SizedBox(
                    height: 30,
                  ),
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
                      ).py(25),
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
                      ).py(25),
                      const Product_Card(
                        imageurl:
                            'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                        product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                        price: '\$1240',
                        status: '',
                      ).py(25),
                    ],
                  ),
                )
              ]).px(ph).py(10)
            ],
          ),
        ),
      ),
    );
  }
}
