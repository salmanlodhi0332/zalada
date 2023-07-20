import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/views/onboarding/onboard_two.dart';

class Onboard_One extends StatelessWidget {
  const Onboard_One({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Image.asset('assets/images/pick_&_pay.png'),
          ).pOnly(bottom: 10),
          Text(
            'onboard_heading_one'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor,
                fontSize: 25),
          ).pOnly(bottom: 10),
          Text(
            'onboard_one_description'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor,
                fontSize: 15),
          ).pOnly(bottom: 10),
          InkWell(
              onTap: () {
                Page_Navigation().Screen(context, Onboard_Two());
              },
              child: Container(
                child: Image.asset('assets/images/Progress_1.png'),
              )),
        ],
      ).px(50),
    );
  }
}
