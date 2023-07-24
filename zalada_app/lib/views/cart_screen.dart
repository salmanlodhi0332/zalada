import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/edit_btn.dart';

import '../custom/botton_widget.dart';
import '../utiles/page_navigation.dart';
import 'onboarding/onboard_two.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Cart',
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        centerTitle: true,
        leading: back_button(
          ontap: () {},
        ),
        actions: [
          edit_button(
            ontap: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              // Column(
              //   children: [
              //     Text('Macbook Pro 15" 2019 Intel core i7'),
              //     Column(
              //       children: [
              //         Text('\$ 150'),
              //         Row(
              //           children: [
              //             IconButton(
              //               icon: Icon(Icons.remove),
              //               onPressed: () {},
              //             ),
              //             Text('1'),
              //             IconButton(
              //               icon: Icon(Icons.add),
              //               onPressed: () {},
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // )

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //  / crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Image.asset('assets/images/cart.png'),
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
                  ).pOnly(bottom: 10).px(25),
                  Button_Widget(width: size.width, title: 'start_Shopping'.tr),
                ],
              ),
              Divider(
                thickness: 3,
                color: Theme.of(context).disabledColor,
              ).py(450),
            ],
          ),
        ),
      ),
    );
  }
}
