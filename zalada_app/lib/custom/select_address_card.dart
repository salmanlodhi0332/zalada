import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';

class select_address_card extends StatefulWidget {
  final String label;
  final String hintText;
  final String NumberText;

  final Widget? preffixIcon;
  final bool selected;
  final Widget? suffixIcon;
  const select_address_card({
    super.key,
    required this.label,
    required this.hintText,
    required this.NumberText,
    this.preffixIcon,
    this.suffixIcon,
    required this.selected,
  });

  @override
  State<select_address_card> createState() => _select_address_cardState();
}

class _select_address_cardState extends State<select_address_card> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height / 5,
        width: size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.selected
                    ? Theme.of(context).indicatorColor.withOpacity(0.5)
                    : Theme.of(context).hintColor.withOpacity(0.5),
                width: 1.0),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).highlightColor),
                    child: Icon(Icons.home)),
                SizedBox(width: 10),
                Text(widget.label,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).hintColor,
                    )),
              ],
            ),

            SizedBox(height: 20),

            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.hintText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintColor,
                    )),
                CircleAvatar(
                  radius: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  backgroundColor:
                      Theme.of(context).disabledColor.withOpacity(0.1),
                ),
              ],
            ),
            Text(widget.NumberText,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).hintColor,
                )),
          ],
        ),
      ),
    );

    // AnimatedContainer(
    //     height: size.height / 7,
    //     width: size.width,
    //     decoration: BoxDecoration(
    //         border: Border.all(
    //             color: widget.selected
    //                 ? Theme.of(context).indicatorColor.withOpacity(0.5)
    //                 : Theme.of(context).hintColor.withOpacity(0.5),
    //             width: 1.0),
    //         borderRadius: BorderRadius.circular(15)),
    //     duration: Duration(milliseconds: 200),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Container(
    //           width: size.width / 7,
    //           decoration: BoxDecoration(
    //               color: Theme.of(context).highlightColor,
    //               borderRadius: BorderRadius.circular(10)),
    //           child: widget.preffixIcon,
    //         ).pOnly(left: 20, top: 10, bottom: 10),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               widget.label,
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.w800,
    //                 color: Theme.of(context).hintColor,
    //               ),
    //             ).py(5),
    //             Text(
    //               widget.hintText,
    //               style: TextStyle(
    //                 color: Theme.of(context).hintColor.withOpacity(0.5),
    //                 fontSize: 15,
    //                 fontWeight: FontWeight.w500,
    //               ),
    //             ),
    //           ],
    //         ).px(10),
    //         widget.selected
    //             ? CircleAvatar(
    //                 radius: 20,
    //                 backgroundColor: Theme.of(context).indicatorColor,
    //                 child: Icon(
    //                   Icons.check,
    //                   color: Colors.white,
    //                 ),
    //               ).p(10)
    //             : CircleAvatar(
    //                 radius: 20,
    //                 backgroundColor: Color.fromARGB(0, 130, 127, 127),
    //               ).p(10),
    //       ],
    //     ));
  }
}
