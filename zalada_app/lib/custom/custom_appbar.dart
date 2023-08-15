import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leadingButton;
  final List<Widget>? actionButtons;
  final Color? backgroundColor;

  const Custom_Appbar({
    Key? key,
    this.title,
    this.leadingButton,
    this.actionButtons,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w700),
            )
          : null,
      leading: leadingButton,
      actions: actionButtons != null
          ? [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  children: actionButtons!,
                ),
              ),
            ]
          : null,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
