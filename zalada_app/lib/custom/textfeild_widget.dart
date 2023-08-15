import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

bool _isLeadingSpace = false;

String? validateInput(String? value) {
  if (value != null && value.isNotEmpty && value.startsWith(' ')) {
    _isLeadingSpace = true;
    return 'Leading spaces are not allowed';
  }
  _isLeadingSpace = false;
  return null;
}

class textfeild_widget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType? keyboardtype;
  final bool? obscureText;
  final bool? readonly;
  const textfeild_widget({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.keyboardtype,
    this.readonly,
  });

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
              style:
                  TextStyle(color: Theme.of(context).hintColor, fontSize: 15),
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
                  width: 1.0),
              borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
                  controller: controller,
                  validator: validator,
                  keyboardType: keyboardtype,
                  obscureText: obscureText ?? false,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(
                        RegExp(r'\s\s+')), // Deny consecutive spaces
                    LeadingSpaceTrimmerInputFormatter(), // Custom input formatter to trim leading spaces
                  ],
                  decoration: InputDecoration(
                      suffixIcon: suffixIcon,
                      hintText: hintText,
                      hintStyle: TextStyle(
                          color: Theme.of(context).hintColor.withOpacity(0.3),
                          fontSize: 15.sp),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)))
              .px(10),
        ),
      ],
    );
  }
}

class LeadingSpaceTrimmerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Trim leading spaces from the text value
    if (newValue.text.startsWith(' ')) {
      final trimmedText = newValue.text.trimLeft();
      return newValue.copyWith(
        text: trimmedText,
        composing: TextRange.collapsed(trimmedText.length),
      );
    }
    return newValue;
  }
}
