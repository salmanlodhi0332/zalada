import 'package:flutter/material.dart';

class edit_button extends StatelessWidget {
  final Function() ontap;
  const edit_button({super.key, required this.ontap});

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.more_horiz_rounded,
            size: 18,
            color: Theme.of(context).hintColor,
          ),
        ),
        //  Image.asset("assets/images/dots.jpg")
      ),
    );
  }
}
