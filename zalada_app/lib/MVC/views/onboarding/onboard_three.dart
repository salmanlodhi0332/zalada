import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/login_screen.dart';

import '../otp_screen.dart';

class Onboard_Three extends StatelessWidget {
  const Onboard_Three({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'skip'.tr,
                style: TextStyle(
                    fontFamily: 'plusjakarta',
                    color: Theme.of(context).hintColor),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/secure-paymet.png'),
            ).pOnly(bottom: 10),
            Text(
              'onboard_heading_two'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                  fontSize: 25),
            ).pOnly(bottom: 10),
            Text(
              'onboard_two_description'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).disabledColor,
                  fontSize: 15),
            ).pOnly(bottom: 40),
            InkWell(
              onTap: () {
                Page_Navigation.getInstance.Page_PushAndReplaceNavigation(context, login_screen());
              },
              child: Container(
                child: Image.asset('assets/images/Progress_3.png'),
              ),
            )
          ],
        ).px(50),
      ),
    );
  }
}
