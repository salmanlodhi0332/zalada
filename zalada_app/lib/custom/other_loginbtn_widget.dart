import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class other_loginBtn_Widget extends StatelessWidget {
  const other_loginBtn_Widget({
    super.key,
    required this.width,
    required this.title, this.tap
  });

  final double width;
  final Function()? tap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                  width: 1.0),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).hintColor),
        ).py(20).centered(),
      ).px(20),
    );
  }
}