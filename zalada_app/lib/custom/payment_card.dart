import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class payment_card extends StatelessWidget {
  final String label;
  final Widget? images;
  final String hintText;
  final Widget? preffixIcon;
  final bool selected;
  final Widget? suffixIcon;
  const payment_card({
    super.key,
    required this.label,
    required this.hintText,
    this.preffixIcon,
    this.suffixIcon,
    required this.selected,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: AnimatedContainer(
      height: size.height / 10,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          border: Border.all(
              color: selected
                  ? Theme.of(context).indicatorColor.withOpacity(0.5)
                  : Theme.of(context).disabledColor.withOpacity(0.3),
              width: 1.0),
          borderRadius: BorderRadius.circular(15)),
      duration: Duration(milliseconds: 200),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Theme.of(context).highlightColor, child: images),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).hintColor,
          ),
        ),
        subtitle: Text(
          hintText,
          style: TextStyle(
            color: Theme.of(context).disabledColor.withOpacity(0.4),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: preffixIcon,
      ),
    ));
  }
}
