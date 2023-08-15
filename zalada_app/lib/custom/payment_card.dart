import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class payment_card extends StatelessWidget {
  Future<String> _getSavedCardname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Cardname') ?? '';
  }

  Future<String> _getSavedCardnumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Cardnumber') ?? '';
  }

  final String label;
  final Widget? images;
  final String hintText;
  final Widget? preffixIcon;
  final bool selected;
  final Widget? suffixIcon;
  const payment_card({
    Key? key,
    required this.label,
    required this.hintText,
    this.preffixIcon,
    this.suffixIcon,
    required this.selected,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: AnimatedContainer(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? size.height / 10
            : size.height / 5,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected
                ? Theme.of(context).indicatorColor.withOpacity(0.5)
                : Theme.of(context).disabledColor.withOpacity(0.3),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        duration: Duration(milliseconds: 200),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).highlightColor,
            child: images,
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).hintColor,
            ),
          ),
          subtitle: Text(
            hintText,
            style: TextStyle(
              color: Theme.of(context).disabledColor.withOpacity(0.4),
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: preffixIcon,
        ),
      ),
    );
  }
}
