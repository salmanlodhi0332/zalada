import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/payment_controller.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:zalada_app/custom/payment_methods/Add_payment_mathods.dart';

import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/payment_card.dart';
import '../../utiles/getxcontroller.dart';
import '../../utiles/page_navigation.dart';
import '../../utiles/themeData.dart';
import 'Address_Screen.dart';

class payment_method extends StatefulWidget {
  payment_method({
    super.key,
  });

  @override
  State<payment_method> createState() => _payment_methodState();
}

class _payment_methodState extends State<payment_method> {
  final controller = Get.put(Payment_Controller());
  final getcontroller = Get.put(getx_GetController());

  String? name;
  @override
  void initState() {
    super.initState();
    _saveLoginData();
    controller.getpayment();
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
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: Scaffold(
        appBar: Custom_Appbar(
          title: "Payment_Method".tr,
          leadingButton: back_button(ontap: () {
            Get.back();
          }),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 50),
              //   child: Obx(() => GestureDetector(
              //         onTap: () {
              //           // Use the observable variables here to trigger updates
              //           select_mastercard.value = !select_mastercard.value;
              //           select_paypal.value = false;
              //           select_appleplay.value = false;
              //         },
              //         child: payment_card(
              //           preffixIcon: Icon(Icons.arrow_forward_ios_outlined),
              //           label: "MasterCard".tr,
              //           selected: select_mastercard.value,
              //           hintText: name ?? "",
              //           images: Image.asset("assets/images/mastercard.png"),
              //         ),
              //       )),
              // ),

              Obx(() => GestureDetector(
                    onTap: () {
                      // Use the observable variables here to trigger updates
                      select_mastercard.value = !select_mastercard.value;
                      select_paypal.value = false;
                      select_appleplay.value = false;
                    },
                    child: Column(
                      children: controller.paymentList.map((payment) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Set your desired background color
                              borderRadius: BorderRadius.circular(
                                  10), // Set your desired border radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Image.asset(
                                        "assets/images/mastercard.png"),
                                  ),
                                  title: Text(
                                    '${payment.cardName}',
                                    style: TextStyle(
                                      color: Colors
                                          .black, // Temporarily set a visible color
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${payment.cardNumber}',
                                    style: TextStyle(
                                      color: Colors
                                          .black, // Temporarily set a visible color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),

              SizedBox(
                height: 10,
              ),
              Obx(() => GestureDetector(
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
              Obx(() => GestureDetector(
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
              // Button_Widget(
              //     ontap: () {
              //       Get.bottomSheet(
              //         Add_Payment_Method(),
              //         isScrollControlled: true,
              //       );
              //     },
              //     width: MediaQuery.of(context).size.width,
              //     title: "Add_new_Payment".tr)
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
              Button_Widget(
                      ontap: () {
                        Page_Navigation.getInstance
                            .Page(context, Address_Screen());
                      },
                      width: width / 1.5,
                      title: "continue".tr)
                  .py(11),
              back_button(
                ontap: () {
                  Get.bottomSheet(
                    Add_Payment_Method(),
                    isScrollControlled: true,
                  );
                },
                icon_widget: Icon(
                  Icons.add,
                  color: Theme.of(context).hoverColor,
                ).p(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
