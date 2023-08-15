import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class search_bar_textfeild extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  void Function(String)? onFieldSubmitted;
  search_bar_textfeild(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onFieldSubmitted,
      this.validator,
      this.suffixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? size.height / 18
          : size.height / 7,
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? size.width / 1.3
          : size.width / 1.1,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
              color: Theme.of(context).hintColor.withOpacity(0.1), width: 1.0),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
              validator: validator,
              onFieldSubmitted: onFieldSubmitted,
              obscureText: obscureText ?? false,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Theme.of(context).hintColor.withOpacity(0.3),
                      fontSize: 12.sp),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none)))
          .px(10),
    );
  }
}
