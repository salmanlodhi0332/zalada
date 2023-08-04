import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Button_Widget extends StatelessWidget {
  const Button_Widget(
      {super.key,
      required this.width,
      required this.title,
      this.color,
      this.height,
      this.brodercolor,
      this.ontap,
      this.icon});

  final double width;
  final Function()? ontap;
  final Widget? icon;
  final double? height;
  final Color? color;
  final Color? brodercolor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height ?? 60,
        width: width,
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).hoverColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: brodercolor ?? Theme.of(context).hoverColor,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: brodercolor ?? Theme.of(context).secondaryHeaderColor),
            ).centered(),
          ],
        ),
      ).px(20),
    );
  }
}
