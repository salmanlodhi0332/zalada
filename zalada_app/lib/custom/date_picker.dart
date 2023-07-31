import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                fontFamily: 'plusjakarta',
                color: Theme.of(context).hintColor,
                fontSize: 15,
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

              // Update the text field with the selected date
              if (pickedDate != null && pickedDate != controller.text) {
                controller.text = pickedDate.toString();
              }
            },
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'plusjakarta',
                color: Theme.of(context).hintColor.withOpacity(0.3),
                fontSize: 15,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ).px(10),
        ),
      ],
    ).px(20);
  }
}