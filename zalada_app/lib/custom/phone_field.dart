import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String number) onInputChanged;

  PhoneNumberInputWidget({
    required this.controller,
    required this.onInputChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          onInputChanged(number.phoneNumber!);
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
        ),
        textFieldController: controller,
        inputDecoration: InputDecoration(
          hintText: 'Enter phone number',
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor.withOpacity(0.3),
            fontSize: 15.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ).px(10);
  }
}
