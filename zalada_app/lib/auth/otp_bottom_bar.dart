// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../custom/button_widget.dart';

class OTP_Bottom_Bar extends GetView {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      // height: height - 200,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
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
                'congratulation'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).hintColor,
                    fontSize: 24),
              ),
            ),
            Text(
              'congratulation_bar_description'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).disabledColor,
                  fontSize: 15),
            ).pOnly(bottom: 10),
            Button_Widget(
              width: width,
              title: 'continue'.tr,
              tap: () {
                Get.bottomSheet(
                  OTP_Bottom_Bar(),
                  isScrollControlled: true,
                );
              },
            ).pOnly(bottom: 30),
          ],
        ),
      ),
    );
  }
}
