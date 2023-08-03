// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/utiles/page_navigation.dart';

import '../custom/botton_widget.dart';

class Order_successful_Bottom_Bar extends GetView {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // height: height - 200,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).disabledColor,
              blurRadius: 30,
              offset: const Offset(0, -10)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: 13, horizontal: (Get.width / 2) - 60),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Center(
              child: Image.asset('assets/images/success.png').pOnly(bottom: 10),
            ),
            Center(
              child: Text(
                'order_successfull'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'plusjakarta',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).hintColor,
                    fontSize: 24),
              ),
            ).py(10),
            Align(
              alignment: Alignment.center,
              child: Text(
                'successfull_bar_description'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'plusjakarta',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).disabledColor,
                    fontSize: 15),
              ).pOnly(bottom: 10),
            ),
            Button_Widget(
              width: width,
              title: 'view_order'.tr,
              ontap: () {
                // Page_Navigation.getInstance.Page(context,());
              },
            ).py(10),
            InkWell(
              onTap: () {
                Page_Navigation.getInstance
                    .Page_pushAndRemoveUntil(context, Bottom_Bar());
              },
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            Theme.of(context).disabledColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'back_to_home'.tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintColor),
                ).py(20).centered(),
              ),
            ).pOnly(bottom: 30)
          ],
        ),
      ),
    );
  }
}
