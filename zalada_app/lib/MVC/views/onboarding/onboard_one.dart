import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/onboarding/onboard_two.dart';

import '../login_screen.dart';

class Onboard_One extends StatelessWidget {
  const Onboard_One({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Page_Navigation.getInstance
                    .Page_pushAndRemoveUntil(context, login_screen());
              },
              child: Text(
                'skip'.tr,
                style: TextStyle(color: Theme.of(context).hintColor),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/pick_&_pay.png'),
            ).pOnly(bottom: 10),
            Text(
              'onboard_heading_one'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  fontSize: 25.sp),
            ).pOnly(bottom: 10),
            Text(
              'onboard_one_description'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).disabledColor,
                  fontSize: 15.sp),
            ).pOnly(bottom: screenHeight * 0.04),
            GestureDetector(
                onTap: () {
                  Page_Navigation.getInstance
                      .Page_pushAndRemoveUntil(context, Onboard_Two());
                },
                child: Container(
                  child: Image.asset('assets/images/Progress_1.png'),
                )),
          ],
        ).px(50),
      ),
    );
  }
}
