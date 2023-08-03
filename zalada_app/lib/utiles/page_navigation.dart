import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Page_Navigation {
  static Page_Navigation? _instance;
  static Page_Navigation get getInstance => _instance ??= Page_Navigation();

  Page(BuildContext context, Widget childwidget) {
    if (Platform.isAndroid) {
      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: childwidget,
          isIos: true,
          duration: Duration(milliseconds: 500),
          reverseDuration: Duration(milliseconds: 400),
        ),
        // MaterialPageRoute(builder: (context) => childwidget)
      );
    } else {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (ctx) => childwidget));
    }
  }

  Page_pushAndRemoveUntil(BuildContext context, Widget childwidget) {
    if (Platform.isAndroid) {
      Navigator.pushAndRemoveUntil(
        context,
        // MaterialPageRoute(builder: (context) => childwidget),
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: childwidget,
          isIos: true,
          duration: Duration(milliseconds: 500),
          reverseDuration: Duration(milliseconds: 400),
        ),
        (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (ctx) => childwidget),
        (route) => false,
      );
    }
  }

  card_navigation(BuildContext context, Widget childwidget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => childwidget),
    );
  }

  void fromleftPage_PushAndReplaceNavigation(
      BuildContext context, Widget childWidget) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.leftToRightWithFade,
        child: childWidget,
        isIos: true,
        duration: Duration(milliseconds: 900),
      ),
      (route) => false,
    );
  }
}
