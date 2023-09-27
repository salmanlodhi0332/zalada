import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/onboarding/onboard_one.dart';

import '../../utiles/shared_preferences.dart';
import 'bottom_bar.dart';
import 'onBoarding_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      isloggedcheck();
    });
  }

  String? token;
  isloggedcheck() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    token = instance.getString("token");
    if (token != null) {
      var _pref = shared_preferences();
      await _pref.Get_userData();
      Page_Navigation.getInstance
          .Page_pushAndRemoveUntil(context, Bottom_Bar());
    } else {
      Page_Navigation.getInstance
          .Page_pushAndRemoveUntil(context, OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/icon/Icon.png'),
            ).pOnly(bottom: 10),
            Text(
              'Kidfit'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  fontSize: 25.sp),
            )
          ],
        ),
      ),
    );
  }
}
