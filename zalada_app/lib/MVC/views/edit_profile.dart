import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/service/Getx_provider.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/date_picker.dart';
import '../../custom/textfeild_widget.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final fullnameController = TextEditingController();
  final dateController = TextEditingController();
  final _phoneController = TextEditingController();
  final emailaddressController = TextEditingController();

  final gendercontroller = SingleValueDropDownController();
  String selectedGender = "Male"; // Initial value

  GetxControllerProvider controllersProvider =
      Get.put(GetxControllerProvider());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: Custom_Appbar(
          title: "Edit_Profile".tr,
          leadingButton: back_button(
            ontap: () {
              Get.back();
            },
          ),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     "Edit_Profile".tr,
        //     style: TextStyle(color: Theme.of(context).hintColor),
        //   ),
        //   leading: back_button(
        //     ontap: () {
        //       Get.back();
        //     },
        //   ).p(10),
        // ),
        // backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Obx(() => Center(
                              child: controllersProvider
                                      .imagePath.value.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 40,
                                      backgroundImage: FileImage(File(
                                          controllersProvider.imagePath.value)),
                                    )
                                  : CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          controllersProvider.defaultImagePath
                                              .toString()),
                                    ))
                          .onTap(() {
                        controllersProvider.getImage();
                      })
// .onTap((){
//   controllersProvider.getImage();
// })
                  ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 8,
              ),
              textfeild_widget(
                label: "Fullname".tr,
                hintText: "Brayn Adma",
                controller: fullnameController,
              ),
              SizedBox(
                height: 8,
              ),
              datepicker_widget(
                controller: dateController,
                label: "Date_of_Birth".tr,
                hintText: "Date",
                suffixIcon: Icon(Icons.calendar_month_outlined),
              ),
              SizedBox(
                height: 4,
              ),
              textfeild_widget(
                label: "Email_Address".tr,
                hintText: "brayn.adam83@gmail.com",
                controller: emailaddressController,
              ),
              SizedBox(
                height: 4,
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
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12))),
                controller: _phoneController,
              ).px(20),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Gender".tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      color: Theme.of(context).hintColor,
                      fontSize: 15),
                ),
              ).px(25).py(10),
              DropDownTextField(
                textFieldDecoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.5)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context)
                            .disabledColor
                            .withOpacity(0.3)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "select Gender",
                ),
                controller: gendercontroller,
                dropDownList: [
                  DropDownValueModel(
                    name: 'Male',
                    value: "Male ",
                  ),
                  DropDownValueModel(
                    name: 'Female',
                    value: "Female ",
                  ),
                ],
              ).px(25).py(10),
              SizedBox(
                height: 20,
              ),
              Button_Widget(
                width: size.width,
                title: "Save Changes",
                ontap: () {},
              ),
              SizedBox(
                height: 8,
              ),
            ])));
  }
}
