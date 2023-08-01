import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/otp_screen.dart';
import 'package:zalada_app/custom/botton_widget.dart';

import '../../custom/other_loginbtn_widget.dart';
import '../../custom/textfeild_widget.dart';
import '../../utiles/page_navigation.dart';
import '../controller/authentication_controller.dart';
import 'bottom_bar.dart';
import 'login_screen.dart';

class registeration_screen extends StatefulWidget {
  const registeration_screen({super.key});

  @override
  State<registeration_screen> createState() => _registeration_screenState();
}

class _registeration_screenState extends State<registeration_screen> {
  @override
  AuthenticationController controller = Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();
  final hideConfirmpassword = true.obs;
  final hidepassword = true.obs;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height / 20),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Text(
                      'Create_account'.tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          color: Theme.of(context).hintColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ).px(20),
                  ],
                ).py(20),
                textfeild_widget(
                  controller: nameController,
                  hintText: 'enter_your_name'.tr,
                  label: 'full_name'.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                textfeild_widget(
                  controller: emailController,
                  hintText: 'email_address'.tr,
                  label: 'email_address'.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                textfeild_widget(
                  controller: phoneController,
                  hintText: 'Phone_number'.tr,
                  label: 'Phone_number'.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => textfeild_widget(
                    controller: passwordController,
                    hintText: 'password'.tr,
                    label: 'password'.tr,
                    obscureText: hidepassword.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidepassword.value = !hidepassword.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(
                        hidepassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => textfeild_widget(
                    controller: passwordController,
                    hintText: 'password'.tr,
                    label: 'Confirm_password'.tr,
                    obscureText: hideConfirmpassword.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        hideConfirmpassword.value = !hideConfirmpassword.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(
                        hideConfirmpassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button_Widget(
                  width: size.width,
                  title: 'Register'.tr,
                  ontap: () {
                    // Page_Navigation.getInstance.Page(
                    //     context,
                    //     OTP_Screen(
                    //       email: emailController.text,
                    //       name: nameController.text,
                    //       password: passwordController.text,
                    //       phone: phoneController.text,
                    //       verfiyId: emailController.text,
                    //     )
                    //     );
                    if (_formKey.currentState!.validate()) {
                      print("Mobile Number with country code" +
                          phoneController.text);
                      controller.mobileotp_Send(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        phoneController.text,
                      );
                      // controller.registerwithEmail();
                      controller.loading.value = !controller.loading.value;
                    } else {
                      Get.snackbar('form', "please_Fill_the_form",
                          backgroundColor: Theme.of(context).cardColor,
                          colorText: Theme.of(context).hintColor);
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Divider(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                      width: size.width / 5,
                    ),
                    Text(
                      'or_continue_with'.tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          color: Theme.of(context).hintColor,
                          fontSize: 20),
                    ).px(10),
                    SizedBox(
                      child: Divider(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                      width: size.width / 5,
                    ),
                  ],
                ).px(20),
                SizedBox(
                  height: 20,
                ),
                other_loginBtn_Widget(
                    icon: Image.asset(
                      'assets/icon/google.png',
                      height: 30,
                      width: 30,
                    ),
                    width: size.width,
                    title: 'Continue_with_google'.tr),
                SizedBox(
                  height: 20,
                ),
                other_loginBtn_Widget(
                    icon: Image.asset(
                      'assets/icon/facebook.png',
                      height: 30,
                      width: 30,
                    ),
                    width: size.width,
                    title: 'Continue_with_facebook'.tr),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If_you_already_have_an_account'.tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          color: Theme.of(context).hintColor,
                          fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        Page_Navigation().Screen(context, login_screen());
                      },
                      child: Text(
                        'login'.tr,
                        style: TextStyle(
                            fontFamily: 'plusjakarta',
                            color: Theme.of(context).focusColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
