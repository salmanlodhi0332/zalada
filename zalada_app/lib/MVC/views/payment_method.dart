import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/payment_card.dart';
import '../../custom/payment_methods/payment_mathods.dart';

class payment_method extends StatefulWidget {
  payment_method({
    super.key,
  });

  @override
  State<payment_method> createState() => _payment_methodState();
}

class _payment_methodState extends State<payment_method> {
  String? name;
  @override
  void initState() {
    super.initState();
    _saveLoginData();
  }

// final String? name;
  void _saveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("Data Set  Sharedprefernce 0");
    name = await prefs.getString('Cardname');
    await prefs.getString('Cardnumber');
    print("full name  $name");
  }

  RxBool select_mastercard = false.obs;

  RxBool select_paypal = false.obs;

  RxBool select_appleplay = false.obs;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: back_button(ontap: () {
            Get.back();
          }).p(10),
          title: Text(
            "Payment_Method".tr,
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontFamily: 'plusjakarta',
            ),
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
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
                        hintText: name ?? "",
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
                      // label: Cardname,
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
              Button_Widget(
                  tap: () {
                    Get.bottomSheet(
                      Add_Payment_Method(),
                      isScrollControlled: true,
                    );
                  },
                  width: MediaQuery.of(context).size.width,
                  title: "Add_new_Payment".tr)
            ],
          ),
        ),
      ),
    );
  }
}
