import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class search_bar_widget extends StatelessWidget {
  final Function()? onTap;
   search_bar_widget({ this.onTap});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: size.width,
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(237, 101, 101, 101).withOpacity(0.20),
                blurRadius: 6.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Theme.of(context).cardColor,
            // border: Border.all(
            //   color: ,
            // ),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/svg/brower.svg",
              height: 17,
              width: 17,
            ).pOnly(right: 14),
            Text(
              "search_product".tr,
              style: TextStyle(
                  color: Theme.of(context).disabledColor, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
