import 'package:flutter/material.dart';

class Dropdown_Widget extends StatelessWidget {
  
  final String hint;
   String value;
 
  final Function(String?) onChanged;

   Dropdown_Widget(
      {
      // required this.label,
      required this.hint,
      required this.value,
      required this.onChanged
      // required this.ontap,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).disabledColor.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            hint: Text(hint),
            value: value,
            onChanged: (newValue) {
              // Update the value when an item is selected
              onChanged(newValue);
            },
            items: [
              DropdownMenuItem<String>(
                value: "Male",
                child: Text("Male"),
              ),
              DropdownMenuItem<String>(
                value: "Female",
                child: Text("Female"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}