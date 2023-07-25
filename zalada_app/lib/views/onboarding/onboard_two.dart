import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/views/onboarding/onboard_three.dart';

import '../../utiles/page_navigation.dart';

class Onboard_Two extends StatelessWidget {
  const Onboard_Two({super.key});

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
                style: TextStyle(color: Theme.of(context).hintColor),
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/images/shopping-basket.png'),
          ).pOnly(bottom: 10),
          Text(
            'onboard_heading_three'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'plusjakarta',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor,
                fontSize: 25),
          ).pOnly(bottom: 10),
          Text(
            'onboard_three_description'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'plusjakarta',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor,
                fontSize: 15),
          ).pOnly(bottom: 10),
          InkWell(
            onTap: () {
              Page_Navigation()
                  .Page_ReplaceNavigation(context, Onboard_Three());
            },
            child: Container(
              child: Image.asset('assets/images/Progress_2.png'),
            ),
          )
        ],
      ).px(50),
    );
  }
}
