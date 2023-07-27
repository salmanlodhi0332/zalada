import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/product_controller.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/edit_btn.dart';

import '../../custom/botton_widget.dart';
import '../../custom/product_card.dart';
import 'cart_products.dart';

class CartScreenWithData extends StatelessWidget {
  final cart_Controller controller = Get.find();
  final cartController = Get.put(cart_Controller());
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
          style: TextStyle(
              color: Theme.of(context).hintColor,
              fontFamily: 'plusjakarta',
              fontWeight: FontWeight.w700),
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
              Obx(
                () => cartController.products.isEmpty
                    ? Column(
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
                          Button_Widget(
                              width: width, title: 'start_Shopping'.tr),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CartProducts(
                                controller: controller,
                                dummyProducts:
                                    controller.products.keys.toList()[index],
                                quantity:
                                    controller.products.values.toList()[index],
                              ),
                              if (index < controller.products.length - 1)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Divider(
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.4),
                                    thickness: 1,
                                  ).py(10),
                                ),
                            ],
                          );
                        },
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Theme.of(context).disabledColor.withOpacity(0.4),
                thickness: 4,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'product_related'.tr,
                  style: const TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
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
