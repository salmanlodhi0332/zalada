import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/svg.dart';

class select_language extends StatefulWidget {
  final String label;

  final Widget? preffixIcon;
  final bool selected;
  const select_language({
    super.key,
    required this.label,
    this.preffixIcon,
    required this.selected,
  });

  @override
  State<select_language> createState() => _select_languageState();
}

class _select_languageState extends State<select_language> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
            border: Border.all(
                color: widget.selected
                    ? Theme.of(context).indicatorColor.withOpacity(0.5)
                    : Theme.of(context).hintColor.withOpacity(0.5),
                width: 1.0),
            borderRadius: BorderRadius.circular(15)),
        
      child: ListTile(
        
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).highlightColor,
          child: widget.preffixIcon,
        ).pOnly(left: 30, top: 10, bottom: 10),
        title: Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'plusjakarta',
            color: Theme.of(context).hintColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        trailing: widget.selected
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
              ).p(10),
      ),
    );
  }
}
