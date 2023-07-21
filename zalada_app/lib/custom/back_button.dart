import 'package:flutter/material.dart';

class back_button extends StatelessWidget {
  final Function() ontap;
  const back_button({super.key, required this.ontap});

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
        child: Icon(
          Icons.arrow_back,
          size: 18,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
