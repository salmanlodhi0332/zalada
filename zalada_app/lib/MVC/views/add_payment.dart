import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/payment_method.dart';

import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/textfeild_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  TextEditingController controllername = TextEditingController();
  TextEditingController controllernumber = TextEditingController();
  TextEditingController controllercvv = TextEditingController();

  void _saveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Cardname', controllername.text);
    await prefs.setString('Cardnumber', controllernumber.toString());

    await prefs.setString('cvv', controllercvv.toString());

    await prefs.setString('Cardnumber', controllernumber.toString());
    print("object Sharedprefernce 0");
    await prefs.getString('Cardname');
    await prefs.getString('Cardnumber');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).hoverColor,
          elevation: 0,
          title: Text(
            'add_new_card'.tr,
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontFamily: 'plusjakarta',
            ),
          ),
          centerTitle: true,
          leading: back_button(
            ontap: () {
              Get.back();
            },
            iconColor: Theme.of(context).cardColor,
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Theme.of(context).hoverColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    width: double.infinity,
                    height: 550,
                    child: Column(
                      children: [
                        SizedBox(height: 130),
                        // Row(
                        //   children: [Text("Card name")],
                        // ).px(35),
                        textfeild_widget(
                          controller: controllername,
                          hintText: 'enter_your_name'.tr,
                          label: 'card_name'.tr,
                        ).px(10),
                        textfeild_widget(
                          controller: controllernumber,
                          hintText: '2727 8907 1278 3726',
                          label: 'card_num'.tr,
                        ).px(10),

                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expiry Date",
                                      style: TextStyle(
                                          fontFamily: 'plusjakarta',
                                          color: Theme.of(context).hintColor,
                                          fontSize: 15),
                                    ).p(10).pOnly(right: 65),
                                  ],
                                ),
                                Container(
                                  height: size.height / 13,
                                  width: size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .hintColor
                                              .withOpacity(0.1),
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                      // validator: validator,
                                      //obscureText: obscureText ?? false,
                                      decoration: InputDecoration(
                                    hintText: "12/1026",
                                    hintStyle: TextStyle(
                                        fontFamily: 'plusjakarta',
                                        color: Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.3),
                                        fontSize: 20),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.calendar_today),
                                    ),
                                  )).px(10),
                                ),
                              ],
                            ).px(30),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CVV",
                                      style: TextStyle(
                                          fontFamily: 'plusjakarta',
                                          color: Theme.of(context).hintColor,
                                          fontSize: 15),
                                    ).p(10).pOnly(right: 100),
                                  ],
                                ),
                                Container(
                                  height: size.height / 13,
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .hintColor
                                              .withOpacity(0.1),
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                      controller: controllercvv,
                                      // validator: validator,
                                      //obscureText: obscureText ?? false,
                                      decoration: InputDecoration(
                                        // suffixIcon: suffixIcon,
                                        hintText: "778",
                                        hintStyle: TextStyle(
                                            fontFamily: 'plusjakarta',
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.3),
                                            fontSize: 20),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      )).px(10),
                                ).pOnly(right: 20),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Button_Widget(
                            tap: () {
                              print('object');
                              print(controllername.toString());
                              print(controllernumber.toString());
                              print(controllercvv.toString());

                              _saveLoginData();
                              Get.to(payment_method());
                            },
                            width: width,
                            title: 'add_payment'.tr),
                      ],
                    )),
              ),
              Positioned(
                top: 20,
                child: Container(
                  width: width / 1.2,
                  height: height / 4,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/payment.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
//   Widget _buildBody() {
//   }
// }
