import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class datepicker_widget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  const datepicker_widget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 15.sp,
              ),
            ).p(10),
          ],
        ),
        Container(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? size.height / 13
              : size.height / 7,
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).hintColor.withOpacity(0.1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            readOnly: true,
            controller: controller,
            validator: validator,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100),
              );

              if (Platform.isAndroid) {
                // ignore: use_build_context_synchronously
                pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
              } else {
                pickedDate = await showModalBottomSheet<DateTime>(
                  context: context,
                  builder: (BuildContext builder) {
                    return Container(
                      height: 250.0,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        minimumYear: 1950,
                        maximumYear: 2100,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime newDate) {
                          // Handle the selected date for CupertinoDatePicker
                          // You can call your onDateTimeChanged method here or do whatever you need.
                          // Example: onDateTimeChanged(newDate);
                        },
                      ),
                    );
                  },
                );
              }

              // if (pickedDate != null && pickedDate != DateTime.now()) {
              //   // Do something with the picked date.
              //   // Example: setState(() { selectedDate = pickedDate; });
              // }
              if (pickedDate != null && pickedDate != controller.text) {
                controller.text = pickedDate.toString();
              }
            },

            // if (Platform.isAndroid) {
            //     DateTime? pickedDate = await showDatePicker(
            //   context: context,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(1950),
            //   lastDate: DateTime(2100),
            // );
            // }else{
            //    DateTime? pickedDate = CupertinoDatePicker(onDateTimeChanged: onDateTimeChanged)
            // }

            // // Update the text field with the selected date
            // if (pickedDate != null && pickedDate != controller.text) {
            //   controller.text = pickedDate.toString();
            // }

            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).hintColor.withOpacity(0.3),
                fontSize: 15.sp,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ).px(10),
        ),
      ],
    );
  }
}
