import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';

class categories_btn extends StatefulWidget {
  final String label;
  final Widget? preffixIcon;
  final bool selected;
  const categories_btn({
    super.key,
    required this.label,
    this.preffixIcon,
    required this.selected,
  });

  @override
  State<categories_btn> createState() => _categories_btnState();
}

class _categories_btnState extends State<categories_btn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // width: size.width/6,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2))
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).highlightColor,
            child: widget.preffixIcon
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: Theme.of(context).hintColor,
            ),
          ).px(10)
        ],
      ).p(5),
    ).px(5);
  }
}
