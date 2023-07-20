import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/views/onboarding/onboard_one.dart';

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
    Page_Navigation().Screen(context, Onboard_One());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/icon/Icon.png'),
            ).pOnly(bottom: 10),
            Text(
              'zalada'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
