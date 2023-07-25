import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/getxcontroller.dart';

import '../auth/order_successful_bottom_bar.dart';
import '../auth/otp_bottom_bar.dart';
import '../custom/back_button.dart';
import '../custom/botton_widget.dart';
import '../utiles/page_navigation.dart';

import '../custom/filter_bar.dart';

class OTP_Screen extends StatefulWidget {
  OTP_Screen({super.key});

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  final controller = Get.put(Mian_GetController());

  @override
  void initState() {
    super.initState();
    controller.startTimer();
  }

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'otp'.tr,
            style: TextStyle(
                fontFamily: 'plusjakarta', color: Theme.of(context).hintColor),
          ),
          leading: back_button(
            pic: Icon(Icons.arrow_back),
            ontap: () {
              Get.back();
            },
          )),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/images/OTP.png'),
          ).pOnly(bottom: 10),
          Text(
            'verfication_code'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'plusjakarta',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor,
                fontSize: 24),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: 'otp_description'.tr,
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).disabledColor,
                  fontSize: 15),
            ),
            TextSpan(
              text: '  +62812 788 6XXXX',
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w700),
            )
          ])).px(50).py(20),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otp_box(context, controller1),
                otp_box(context, controller2),
                otp_box(context, controller3),
                otp_box(context, controller4)
              ],
            ),
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.countdown == 0
                      ? TextButton(
                          onPressed: () {}, child: Text('resend_code'.tr))
                      : Text(
                          'recent_code'.tr,
                          style: TextStyle(
                              fontFamily: 'plusjakarta',
                              color: Theme.of(context).hintColor,
                              fontSize: 16),
                        ),
                  Text(
                      controller.countdown == 0
                          ? ''
                          : controller.countdown.toString() + 's',
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          color: Theme.of(context).hintColor,
                          fontSize: 16)),
                ],
              )).py(20),
          Button_Widget(
            width: width,
            title: 'continue'.tr,
            tap: () {
              Get.bottomSheet(
                Order_successful_Bottom_Bar(),
                isScrollControlled: true,
              );
            },
          )
        ],
      ).px(50),
    );
  }

  Container otp_box(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).disabledColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10)),
      height: 60,
      width: 60,
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(
              fontFamily: 'plusjakarta', color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
