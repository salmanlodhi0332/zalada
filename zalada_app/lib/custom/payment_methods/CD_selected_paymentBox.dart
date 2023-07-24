import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';

class CD_selected_paymentbox extends StatefulWidget {
  final String label;
  final String hintText;
  final Widget? preffixIcon;
  final bool selected;
  const CD_selected_paymentbox({
    super.key,
    required this.label,
    required this.hintText,
    this.preffixIcon,
    required this.selected,
  });

  @override
  State<CD_selected_paymentbox> createState() => _CD_selected_paymentboxState();
}

class _CD_selected_paymentboxState extends State<CD_selected_paymentbox> {
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
                    : Theme.of(context).hintColor.withOpacity(0.5),
                width: 2.0),
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
            ).pOnly(left: 30, top: 10, bottom: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    
                fontFamily: 'plusjakarta',
                    color: Theme.of(context).hintColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ).py(5),
                Text(
                  widget.hintText,
                  style: TextStyle(
                    
                fontFamily: 'plusjakarta',
                    color: Theme.of(context).hintColor.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
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
                  ).p(10)
          ],
        ));
  }
}
