import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/payment_controller.dart';
import 'package:zalada_app/MVC/views/add_payment.dart';
import 'package:zalada_app/custom/payment_methods/CD_selected_paymentBox.dart';
import 'package:zalada_app/custom/payment_methods/paymentgetway_selected.dart';

import '../../utiles/page_navigation.dart';
import '../../MVC/views/otp_screen.dart';
import '../botton_widget.dart';

class Add_Payment_Method extends GetView {
  // Use RxBool from GetX library
  RxBool select_card = false.obs;
  RxBool select_paypal = false.obs;
  RxBool select_applepay = false.obs;

  final controller = Get.put(Payment_Controller());

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
        padding: EdgeInsets.symmetric(horizontal: 15),
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
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Add_new_payment_method'.tr,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).py(10),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  Get.to(AddPayment());

                  select_card.value = !select_card.value;
                  select_applepay.value = false;
                  select_paypal.value = false;
                },
                child: CD_selected_paymentbox(
                  preffixIcon: Icon(Icons.credit_card),
                  // Image.asset(
                  //   'assets/icon/facebook.png',
                  //   height: 30,
                  //   width: 30,
                  // ),
                  label: 'Credit_or_Debit'.tr,
                  hintText: 'Payment_description'.tr,
                  selected:
                      select_card.value, // Access the bool value using .value
                ),
              ),
            ).py(10),
            Obx(
              () => GestureDetector(
                onTap: () {
                  select_paypal.value = !select_paypal.value;
                  select_card.value = false;
                },
                child: paymentgetway_selected(
                  preffixIcon: Image.asset(
                    'assets/images/paypal.png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'Paypal',
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
                child: paymentgetway_selected(
                  preffixIcon: Image.asset(
                    'assets/images/apple.png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'Apple Pay',
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
