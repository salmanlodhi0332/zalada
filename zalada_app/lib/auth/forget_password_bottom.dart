import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/forget_password_widget/selectedbox.dart';

import '../custom/botton_widget.dart';
import '../utiles/page_navigation.dart';
import '../views/otp_screen.dart';
import 'otp_bottom_bar.dart';

class Forget_password_bottom extends GetView {
  // Use RxBool from GetX library
  RxBool select_number = false.obs;
  RxBool select_email = false.obs;
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
              'Forget_password_title'.tr,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ).py(10),
            Wrap(children: [
              Text(
                'Forget_password_description'.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).disabledColor,
                  fontSize: 20,
                ),
              ).pOnly(bottom: 10),
            ]),
            Obx(
              () => InkWell(
                onTap: () {
                  select_number.value = !select_number.value;
                  select_email.value = false;
                },
                child: selected_box(
                  label: 'Send via WhatsApp',
                  hintText: '+62812 788 61 1672',
                  selected:
                      select_number.value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Obx(
              () => InkWell(
                onTap: () {
                  select_email.value = !select_email.value;
                  select_number.value = false;
                },
                child: selected_box(
                  label: 'Send via WhatsApp',
                  hintText: '+62812 788 61 1672',
                  selected:
                      select_email.value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Button_Widget(
              width: width,
              title: 'continue'.tr,
              tap: () {
                Page_Navigation().Screen(context, OTP_Screen());
              },
            ).pOnly(bottom: 30),
          ],
        ),
      ),
    ).p(15);
  }
}
