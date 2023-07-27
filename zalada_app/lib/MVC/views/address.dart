import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';
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
    final _phoneController = TextEditingController();

    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          actions: [
            back_button(
              ontap: () {},
              pic: SvgPicture.asset(
                "assets/svg/brower.svg",
              ).p(4),
            ).p(10)
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: back_button(ontap: () {}).p(10),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                        height: size.height * 0.5,
                        width: size.width,
                        child: Image.asset("assets/images/Map.png"))),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "Select_Your_location_from_the_map".tr,
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
                    "Move_the_pin_on_the_map_to_find_your_location_and_select_the_delievery_address"
                        .tr,
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Phone_number".tr,
                    style: TextStyle(
                        fontFamily: 'plusjakarta',
                        color: Theme.of(context).hintColor,
                        fontSize: 15),
                  ),
                ).px(25).py(10),
                IntlPhoneField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12))),
                  controller: _phoneController,
                ).px(20),
                SizedBox(
                  height: 30,
                ),
                Button_Widget(width: size.width, title: "Add_Address".tr)
              ],
            ),
          ),
        ));
  }
}
