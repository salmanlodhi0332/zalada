import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Button_Widget extends StatelessWidget {
  const Button_Widget(
      {super.key,
      required this.width,
      required this.title,
      this.tap,
      this.icon});

  final double width;
  final Function()? tap;
  final Widget? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 70,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).secondaryHeaderColor),
            ).centered(),
          ],
        ),
      ).px(20),
    );
  }
}
