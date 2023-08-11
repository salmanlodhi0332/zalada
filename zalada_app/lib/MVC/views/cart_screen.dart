import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/MVC/views/confirm_order.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/product_card.dart';
import '../controller/cart_controller.dart';
import 'cart_products.dart';

class Cart_Screen extends StatefulWidget {
  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  final cartController = Get.put(cart_Controller());

  @override
  void initState() {
    super.initState();
    cartController.getproductLike();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final ph = 20.0;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Custom_Appbar(
        title: "cart".tr,
        // leadingButton: back_button(
        //   ontap: () {
        //     Get.back();
        //   },
        // ),
        actionButtons: [
          back_button(
            ontap: () {},
            icon_widget: Icon(
              Icons.more_horiz_rounded,
              size: 15,
              color: Theme.of(context).hintColor,
            ).p(8),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Obx(() => cartController.cartproductlist.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //  / crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              child:
                                  Image.asset('assets/images/empty_cart.png'),
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
                                ontap: () {
                                  Page_Navigation.getInstance
                                      .Page(context, Bottom_Bar());
                                },
                                width: width,
                                title: 'start_Shopping'.tr),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      : Column(
                          children: cartController.cartproductlist
                              .map(
                                (e) => CartProducts(
                                  controller: cartController,
                                  Products: e,
                                ),
                              )
                              .toList(),
                        )
                  // : ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: controller.products.length,
                  //     itemBuilder: (context, index) {
                  //       print('');
                  //       return Column(
                  //         children: [
                  //           CartProducts(
                  //             controller: controller,
                  //             dummyProducts:
                  //                 controller.products.keys.toList()[index],
                  //             quantity:
                  //                 controller.products.values.toList()[index],
                  //           ),
                  //           if (index < controller.products.length - 1)
                  //             Padding(
                  //               padding: const EdgeInsets.only(
                  //                   left: 20, right: 20),
                  //               child: Divider(
                  //                 color: Theme.of(context)
                  //                     .disabledColor
                  //                     .withOpacity(0.4),
                  //                 thickness: 1,
                  //               ).py(10),
                  //             ),
                  //         ],
                  //       );
                  //     },
                  //   ),
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
                  'product_you_like'.tr,
                  style: const TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: cartController.islikeLoading.value == false
                          ? [
                              Text(
                                'no_data'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).hintColor),
                              )
                            ]
                          : cartController.product_youlike_list
                              .map(
                                (element) => Product_Card(
                                  id: 1,
                                  hotdeal: '',
                                  imageurl:
                                      'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                                  product_name:
                                      'Macbook Pro 15" 2019 -Intel corei7',
                                  price: '\$1240',
                                ),
                              )
                              .toList()
                      // [
                      //   const Product_Card(
                      //     id: 1,
                      //     hotdeal: '',
                      //     imageurl:
                      //         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                      //     product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                      //     price: '\$1240',
                      //   ),
                      //   const Product_Card(
                      //     id: 1,
                      //     hotdeal: '',
                      //     imageurl:
                      //         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                      //     product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                      //     price: '\$1240',
                      //   ).px(10),
                      //   const Product_Card(
                      //     id: 1,
                      //     hotdeal: '',
                      //     imageurl:
                      //         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                      //     product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                      //     price: '\$1240',
                      //   ).py(25),
                      //   const Product_Card(
                      //     id: 1,
                      //     hotdeal: '',
                      //     imageurl:
                      //         'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                      //     product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                      //     price: '\$1240',
                      //   ).px(10),
                      // ],
                      ),
                )
              ]).px(ph).py(5),
              // cartController.cartproductlist.isEmpty
              //     ? SizedBox()
              //     : Button_Widget(
              //         ontap: () {
              //           Page_Navigation.getInstance
              //               .Page(context, ConfirmOrder());
              //         },
              //         width: width,
              //         title: 'checkout'.tr),
            ],
          ),
        ),
      ),
      bottomNavigationBar: cartController.cartproductlist.isEmpty
          ? SizedBox()
          : Container(
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                children: [
                  Button_Widget(
                          ontap: () {
                            Page_Navigation.getInstance.Page(
                              context,
                              ConfirmOrder(),
                            );
                          },
                          width: width / 1.2,
                          title: "checkout".tr)
                      .py(11),
                ],
              ),
            ),
    );
  }
}
