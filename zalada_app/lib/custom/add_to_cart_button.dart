import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class add_to_cart_button extends StatelessWidget {
  final Function() ontap;
  final Widget? pic;
  final Color? iconColor;
  const add_to_cart_button(
      {super.key, required this.ontap, this.pic, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          margin: const EdgeInsets.all(7),
          // decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //         color: Theme.of(context).disabledColor.withOpacity(0.3))),
          child: pic ??
              SvgPicture.asset(
                "assets/svg/cart.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              )),
    );
  }
}
