import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class select_address_card extends StatelessWidget {
  final String label;
  final String hintText;
  final String NumberText;
  // final Widget? svgicon;
  final Widget? image;

  final Widget? preffixIcon;
  final bool selected;
  final Widget? suffixIcon;

  select_address_card(
      {super.key,
      required this.label,
      required this.hintText,
      required this.NumberText,
      this.preffixIcon,
      this.suffixIcon,
      required this.selected,
      // required this.svgicon,
      this.image});

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
                color: selected
                    ? Theme.of(context).indicatorColor.withOpacity(0.5)
                    : Theme.of(context).disabledColor.withOpacity(0.3),
                width: 1.0),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: size.height / 25,
                  // width: 30,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).highlightColor),
                  child: image,
                ),
                SizedBox(width: 10),
                Text(label,
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
                Text(hintText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintColor,
                    )),
                CircleAvatar(
                  radius: 25,
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
            Text(NumberText,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).hintColor,
                )),
          ],
        ),
      ),
    );
  }
}
