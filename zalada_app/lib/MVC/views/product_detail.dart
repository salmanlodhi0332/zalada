import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:readmore/readmore.dart';
import 'package:zalada_app/custom/botton_widget.dart';
import 'package:zalada_app/custom/product_card.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/views/confirm_order.dart';

class Product_Detail_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;
    final ph = 20.0;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: back_button(ontap: () {
          Get.back();
        }),
        actions: [
          back_button(
            ontap: () {},
            pic: Image.asset(
              'assets/images/favorite.png',
              color: Theme.of(context).hintColor,
            ).p(7),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Wrap(
          // alignment: WrapAlignment.center,
          children: [
            Text(
              'Macbook Pro 15" 2019 -Intel Corei7',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  fontSize: 47,
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.bold),
            ).pOnly(bottom: 10).px(ph),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/default.png',
                        height: hieght / 15,
                      ),
                    ).pOnly(bottom: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/default.png',
                        height: hieght / 15,
                      ),
                    ).pOnly(bottom: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/default.png',
                        height: hieght / 15,
                      ),
                    ).pOnly(bottom: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/default.png',
                        height: hieght / 15,
                      ),
                    ).pOnly(bottom: 10),
                  ],
                ).pOnly(right: 50),
                Container(
                  width: width / 1.7,
                  height: hieght / 2.7,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/product_two.png'))),
                )
              ],
            ).px(ph),
            Align(
              alignment: Alignment.center,
              child: Text(
                'space_grey'.tr,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'plusjakarta',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).disabledColor),
              ),
            ).px(ph),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).disabledColor, width: 2.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).disabledColor,
                        shape: BoxShape.circle),
                    height: 40,
                    width: 40,
                  ),
                ).pOnly(right: 10),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //     color: Theme.of(context).disabledColor, width: 2.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).hoverColor,
                        shape: BoxShape.circle),
                    height: 40,
                    width: 40,
                  ),
                ).pOnly(right: 10),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //     color: Theme.of(context).disabledColor, width: 2.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        shape: BoxShape.circle),
                    height: 40,
                    width: 40,
                  ),
                ).pOnly(right: 10),
              ],
            ).px(ph),
            Divider(
              color: Theme.of(context).disabledColor.withOpacity(0.4),
              thickness: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'product_descritpion'.tr,
                  style: const TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ).pOnly(bottom: 10),
                ReadMoreText(
                  'New variant MacBook Pro 15" 2018 Intel Core i7 gen 11 with Touch Bar ID variant MacBook Pro 15" 2018 Intel Core i7 gen 11 with Touch Bar ID is is various versions have evolved over the years.. '
                      .tr,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'read_more'.tr,
                  trimExpandedText: 'read_less'.tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).disabledColor),
                  moreStyle: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).focusColor),
                ),
              ],
            ).px(ph).py(10),
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
            ]).px(ph).py(10)
          ],
        ),
      ),
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
            back_button(
              ontap: () {},
              pic: Image.asset(
                'assets/images/cart.png',
                color: Theme.of(context).hintColor,
              ).p(15),
            ),
            Button_Widget(
                    tap: () {
                      Page_Navigation.getInstance
                          .Page_ReplaceNavigation(context, ConfirmOrder());
                    },
                    width: width / 1.5,
                    title: 'Checkout \$1240')
                .py(11)
          ],
        ),
      ),
    );
  }
}
