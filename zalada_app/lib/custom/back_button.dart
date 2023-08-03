import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class back_button extends StatelessWidget {
  final Function() ontap;
  final Widget? icon_widget;
  final Color? iconColor;
  const back_button(
      {super.key, required this.ontap, this.icon_widget, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).disabledColor.withOpacity(0.3))),
          child: Center(
            child: icon_widget ??
                Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: Theme.of(context).hintColor,
                ).p(8),
          )),
    );
  }
}
