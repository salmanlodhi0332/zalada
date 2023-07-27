import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/forget_password_widget/selectedbox.dart';

import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/payment_card.dart';
import '../../custom/payment_methods/paymentgetway_selected.dart';

class payment_method extends StatelessWidget {
  payment_method({super.key});

  RxBool select_mastercard = false.obs;

  RxBool select_paypal = false.obs;

  RxBool select_appleplay = false.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: back_button(ontap: () {}).p(10),
          title: Text(
            "Payment_Method".tr,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Obx(() => InkWell(
                    onTap: () {
                      // Use the observable variables here to trigger updates
                      select_mastercard.value = !select_mastercard.value;
                      select_paypal.value = false;
                      select_appleplay.value = false;
                    },
                    child: payment_card(
                      preffixIcon: Icon(Icons.arrow_forward_ios_outlined),
                      label: "MasterCard".tr,
                      selected: select_mastercard.value,
                      hintText: "****12334266656",
                      images: Image.asset("assets/images/mastercard.png"),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => InkWell(
                  onTap: () {
                    select_mastercard.value = false;
                    select_paypal.value = !select_paypal.value;
                    select_appleplay.value = false;
                  },
                  child: payment_card(
                    preffixIcon: Icon(Icons.arrow_forward_ios_outlined),
                    label: "PayPal".tr,
                    selected: select_paypal.value,
                    hintText: "****12334266656",
                    images: Image.asset("assets/images/paypal.png"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Obx(() => InkWell(
                  onTap: () {
                    select_mastercard.value = false;
                    select_paypal.value = false;
                    select_appleplay.value = !select_appleplay.value;
                  },
                  child: payment_card(
                    preffixIcon: Icon(Icons.arrow_forward_ios_outlined),
                    label: "Apple_Pay".tr,
                    selected: select_appleplay.value,
                    hintText: "****12334266656",
                    images: Image.asset("assets/images/apple.png"),
                  ),
                )),
            SizedBox(
              height: 300,
            ),
            Button_Widget(width: size.width, title: "Add_new_Payment".tr)
          ],
        ));
  }
}
