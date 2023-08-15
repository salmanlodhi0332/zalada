import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';

class paymentgetway_selected extends StatefulWidget {
  final String label;

  final Widget? preffixIcon;
  final bool selected;
  const paymentgetway_selected({
    super.key,
    required this.label,
    this.preffixIcon,
    required this.selected,
  });

  @override
  State<paymentgetway_selected> createState() => _paymentgetway_selectedState();
}

class _paymentgetway_selectedState extends State<paymentgetway_selected> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
        height: size.height / 12,
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.selected
                    ? Theme.of(context).indicatorColor.withOpacity(0.5)
                    : Theme.of(context).disabledColor.withOpacity(0.3),
                width: 2.0),
            borderRadius: BorderRadius.circular(15)),
        duration: Duration(milliseconds: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 7,
              height: size.height,
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.preffixIcon,
              ),
            ).pOnly(left: 1, top: 1, bottom: 1),
            Text(
              widget.label,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            widget.selected
                ? CircleAvatar(
                    radius: 10,
                    backgroundColor: Theme.of(context).indicatorColor,
                    child: Icon(
                      size: 10,
                      Icons.check,
                      color: Colors.white,
                    ),
                  ).p(10)
                : CircleAvatar(
                    radius: 10,
                    backgroundColor: Color.fromARGB(0, 130, 127, 127),
                  ).p(10)
          ],
        ));
  }
}
