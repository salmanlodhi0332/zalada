import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/language/select_language.dart';

import '../../utiles/page_navigation.dart';
import '../../MVC/views/otp_screen.dart';
import '../botton_widget.dart';

class language_bottom_sheet extends GetView {
  // Use RxBool from GetX library
  RxBool select_card = false.obs;
  RxBool select_paypal = false.obs;
  RxBool select_applepay = false.obs;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      // height: height - 200,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).disabledColor,
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
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
                vertical: 13,
                horizontal: (Get.width / 2) - 60,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            Text(
              'select_language'.tr,
              style: TextStyle(
                fontFamily: 'plusjakarta',
                color: Theme.of(context).hintColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ).py(10),
            Obx(
              () => GestureDetector(
                onTap: () {
                  select_paypal.value = !select_paypal.value;
                  select_card.value = false;
                },
                child: select_language(
                  preffixIcon: Image.asset(
                    'assets/icon/Indonesia.png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'indonesia'.tr,
                  selected:
                      select_paypal.value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Obx(
              () => GestureDetector(
                onTap: () {
                  select_applepay.value = !select_applepay.value;
                  select_card.value = false;
                },
                child: select_language(
                  preffixIcon: Image.asset(
                    'assets/icon/English(US).png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'English(US)'.tr,
                  selected: select_applepay
                      .value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Obx(
              () => GestureDetector(
                onTap: () {
                  select_applepay.value = !select_applepay.value;
                  select_card.value = false;
                },
                child: select_language(
                  preffixIcon: Image.asset(
                    'assets/icon/Thailand.png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'thailand'.tr,
                  selected: select_applepay
                      .value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Obx(
              () => GestureDetector(
                onTap: () {
                  select_applepay.value = !select_applepay.value;
                  select_card.value = false;
                },
                child: select_language(
                  preffixIcon: Image.asset(
                    'assets/icon/Chinese.png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'chinese'.tr,
                  selected: select_applepay
                      .value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Button_Widget(
              width: width,
              title: 'continue'.tr,
              ontap: () {
                // Page_Navigation().Screen(context, OTP_Screen());
              },
            ).pOnly(bottom: 30),
          ],
        ),
      ),
    ).p(15);
  }
}
