import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/botton_widget.dart';
import 'package:zalada_app/views/otp_screen.dart';
import 'package:zalada_app/views/registeration_screen.dart';

import '../custom/other_loginbtn_widget.dart';
import '../custom/textfeild_widget.dart';
import '../utiles/page_navigation.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  final hidepassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: size.height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'login_account'.tr,
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ).px(20),
                ],
              ).py(20),
              textfeild_widget(
                controller: email,
                hintText: 'email_address'.tr,
                label: 'email_address'.tr,
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => textfeild_widget(
                  controller: email,
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
              InkWell(
                onTap: () {
                  Page_Navigation().Screen(context, OTP_Screen());
                },
                child: Text(
                  'Forget_password'.tr,
                  style: TextStyle(
                      color: Theme.of(context).hintColor, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button_Widget(width: size.width, title: 'login'.tr),
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
                    width: size.width / 4,
                  ),
                  Text(
                    'or_continue_with'.tr,
                    style: TextStyle(
                        color: Theme.of(context).hintColor, fontSize: 20),
                  ).px(10),
                  SizedBox(
                    child: Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.3),
                      thickness: 1,
                    ),
                    width: size.width / 4,
                  ),
                ],
              ).px(20),
              SizedBox(
                height: 20,
              ),
              other_loginBtn_Widget(
                  icon: Image.asset('assets/icon/google.png'),
                  width: size.width,
                  title: 'Continue_with_google'.tr),
              SizedBox(
                height: 20,
              ),
              other_loginBtn_Widget(
                icon: Image.asset('assets/icon/facebook.png'),
                  width: size.width, title: 'Continue_with_facebook'.tr),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont_have_an_account'.tr,
                    style: TextStyle(
                        color: Theme.of(context).hintColor, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Page_Navigation().Screen(context, registeration_screen());
                    },
                    child: Text(
                      'Register'.tr,
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
