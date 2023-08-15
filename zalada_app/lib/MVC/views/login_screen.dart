import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/botton_widget.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/MVC/views/otp_screen.dart';
import 'package:zalada_app/MVC/views/registeration_screen.dart';

import '../../auth/forget_password_bottom.dart';
import '../../custom/other_loginbtn_widget.dart';
import '../../custom/textfeild_widget.dart';
import '../../utiles/page_navigation.dart';
import '../controller/authentication_controller.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  final _formKey = GlobalKey<FormState>();
  AuthenticationController controller = Get.put(AuthenticationController());

  final hidepassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: size.height / 20),
                Row(
                  children: [
                    Text(
                      'login_account'.tr,
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500),
                    ).px(20),
                  ],
                ).py(20),
                textfeild_widget(
                  controller: email,
                  hintText: 'email_address'.tr,
                  label: 'email_address'.tr,
                ).px(15),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => textfeild_widget(
                    controller: password,
                    hintText: 'password'.tr,
                    label: 'password'.tr,
                    validator: (input) =>
                        input!.length == 0 ? "validation_password".tr : null,
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
                  ).px(15),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Forget_password_bottom(),
                      isScrollControlled: true,
                    );
                  },
                  child: Text(
                    'Forget_password'.tr,
                    style: TextStyle(
                        color: Theme.of(context).hintColor, fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button_Widget(
                  width: size.width,
                  title: 'login'.tr,
                  ontap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.loginwithEmail(
                          email.text, password.text, context);
                    } else {
                      Get.snackbar(
                          'form_validation'.tr, 'please_Fill_the_form'.tr,
                          backgroundColor: Theme.of(context).cardColor,
                          colorText: Theme.of(context).hintColor);
                    }

                    // Page_Navigation.getInstance.Page(context, Bottom_Bar());
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
                          color: Theme.of(context).hintColor, fontSize: 20.sp),
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
                    tap: () {
                      controller.loginWithGoogle();
                    },
                    icon: Image.asset(
                      'assets/icon/google.png',
                      height: 25,
                      width: 30,
                    ),
                    width: size.width,
                    title: 'Continue_with_google'.tr),
                SizedBox(
                  height: 20,
                ),
                other_loginBtn_Widget(
                    // tap: () {
                    //   controller.loginWithApple();
                    // },
                    icon: Image.asset(
                      'assets/icon/apple.png',
                      height: 25,
                      width: 30,
                    ),
                    width: size.width,
                    title: 'Continue_with_apple'.tr),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont_have_an_account'.tr,
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 20.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Page_Navigation.getInstance.Page_pushAndRemoveUntil(
                            context, registeration_screen());
                      },
                      child: Text(
                        'Register'.tr,
                        style: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                )
              ],
            ).py(30),
          ),
        ),
      ),
    );
  }
}
