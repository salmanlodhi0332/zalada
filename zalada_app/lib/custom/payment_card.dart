import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';

class payment_card extends StatefulWidget {
  final String label;
  final String hintText;
  final Widget? preffixIcon;
  final bool selected;
  final Widget? suffixIcon;
  const payment_card({
    super.key,
    required this.label,
    required this.hintText,
    this.preffixIcon,
    this.suffixIcon,
    required this.selected,
  });

  @override
  State<payment_card> createState() => _payment_cardState();
}

class _payment_cardState extends State<payment_card> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
        height: size.height / 10,
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.selected
                    ? Theme.of(context).indicatorColor.withOpacity(0.5)
                    : Theme.of(context).hintColor.withOpacity(0.5),
                width: 1.0),
            borderRadius: BorderRadius.circular(15)),
        duration: Duration(milliseconds: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 7,
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(10)),
              child: widget.preffixIcon,
            ).pOnly(left: 20, top: 10, bottom: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).hintColor,
                  ),
                ).py(5),
                Text(
                  widget.hintText,
                  style: TextStyle(
                    color: Theme.of(context).hintColor.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ).px(10),
            widget.selected
                ? CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).indicatorColor,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ).p(10)
                : CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(0, 130, 127, 127),
                  ).p(10),
          ],
        ));
  }
}
