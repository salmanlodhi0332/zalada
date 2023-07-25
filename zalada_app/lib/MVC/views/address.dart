import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:zalada_app/custom/botton_widget.dart';

import '../../custom/back_button.dart';
import '../../custom/textfeild_widget.dart';

class address extends StatefulWidget {
  const address({super.key});

  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          actions: [
            back_button(
              ontap: () {},
              pic: SvgPicture.asset(
                "assets/svg/brower.svg",
              ),
            )
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: back_button(ontap: () {}),
          title: Text(
            "Select_Address".tr,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Center(
                      child: Container(
                          height: size.height * 0.5,
                          width: size.width,
                          child: Image.asset("assets/images/Map.png"))),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Select Your location from the map",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Move the pin on the map to find your location and select the delievery address",
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                textfeild_widget(
                  label: "Address_name".tr,
                  hintText: "Apartment",
                  controller: addressController,
                ),
                SizedBox(
                  height: 15,
                ),
                textfeild_widget(
                  label: "Address_detail".tr,
                  hintText: "Street No B-120",
                  controller: addressController,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: () {
                      // Do something when the pin icon is pressed
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Phone No".tr,
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.DROPDOWN,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Button_Widget(width: size.width, title: "Add Address")
              ],
            ),
          ),
        ));
  }
}
