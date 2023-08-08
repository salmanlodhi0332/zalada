import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zalada_app/MVC/model/user_model.dart';
import 'package:zalada_app/service/Getx_provider.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/loader.dart';
import 'package:zalada_app/utiles/shared_preferences.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../../custom/date_picker.dart';
import '../../custom/textfeild_widget.dart';
import '../controller/authentication_controller.dart';

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

  AuthenticationController controller = Get.put(AuthenticationController());
  final _formkey = GlobalKey<FormState>();

  GetxControllerProvider controllersProvider =
      Get.put(GetxControllerProvider());
  @override
  void initState() {
    super.initState();
    isloggedcheck();
  }

  String? token;
  String? fullName;
  String? email;
  String? phone_number;

  isloggedcheck() async {
    BuildContext context;
    SharedPreferences instance = await SharedPreferences.getInstance();
    token = instance.getString("token");
    fullName = instance.getString("name");
    email = instance.getString("email");
    phone_number = instance.getString("phone_number");

    print(
      "token $token ",
    );
    print("fullName $fullName ");
    print("Email  $email ");
    print("phone_number  $phone_number ");
    fullnameController.text = fullName.toString();
    emailaddressController.text = email.toString();

    _phoneController.text = phone_number.toString();
  }

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
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Obx(() => Center(
                          child: controllersProvider.imagePath.value.isNotEmpty
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
                  })),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 8,
              ),
              textfeild_widget(
                label: "Fullname".tr,
                hintText: "fullName",
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
                hintText: "Email",
                controller: emailaddressController,
              ),
              SizedBox(
                height: 4,
              ),
              textfeild_widget(
                label: "Phone_NO".tr,
                hintText: "Phone no",
                controller: _phoneController,
              ),
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
                  ontap: () {
                    if (_formkey.currentState!.validate()) {
                      var userData = UserModel(
                          name: fullnameController.text,
                          email: emailaddressController.text,
                          password: "",
                          phone_number: _phoneController.text,
                          userimage: "",
                          fcm: "",
                          gender: gendercontroller.dropDownValue.toString(),
                          dateofbrith: dateController.text);
                      controller.updateProfile(userData, context);
                      controllersProvider.imagePath.value = '';
                    } else {
                      Get.snackbar('form'.tr, 'please_Fill_the_form'.tr,
                          backgroundColor: Theme.of(context).cardColor,
                          colorText: Theme.of(context).hintColor);
                    }
                  }),
              SizedBox(
                height: 8,
              ),
            ])));
  }
}
