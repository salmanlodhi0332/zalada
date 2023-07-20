import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class Page_Navigation {
  // card_navigation(BuildContext context, Widget childwidget) {
  //   return Navigator.push(
  //     context,
  //     PageTransition(
  //       type: PageTransitionType.bottomToTop,
  //       child: childwidget,
  //       isIos: true,
  //       duration: Duration(milliseconds: 500),
  //       reverseDuration: Duration(milliseconds: 400),
  //     ),
  //   );
  // }
  card_navigation(BuildContext context, Widget childwidget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => childwidget),
    );
  }

  // Page_PushNavigation(BuildContext context, Widget childwidget) {
  //   return Navigator.push(
  //     context,
  //     PageTransition(
  //       type: PageTransitionType.rightToLeftWithFade,
  //       child: childwidget,
  //       isIos: false,
  //       duration: Duration(milliseconds: 500),
  //       reverseDuration: Duration(milliseconds: 400),
  //     ),
  //   );
  // }



  Screen(BuildContext context, Widget childwidget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => childwidget),
    );
  }

  // Page(BuildContext context, Widget childwidget) {
  //   return Navigator.push(
  //     context,
  //     PageTransition(
  //       type: PageTransitionType.fade,
  //       child: childwidget,
  //       isIos: false,
  //       duration: Duration(milliseconds: 400),
  //       reverseDuration: Duration(milliseconds: 400),
  //     ),
  //   );
  // }

  void Page_PushAndReplaceNavigation(BuildContext context, Widget childWidget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => childWidget,
      ),
      (route) => false,
    );
  }

  // void Page_PushAndReplaceNavigation(BuildContext context, Widget childWidget) {
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     PageTransition(
  //       type: PageTransitionType.rightToLeftWithFade,
  //       child: childWidget,
  //       isIos: true,
  //       duration: Duration(milliseconds: 900),
  //       reverseDuration: Duration(milliseconds: 400),
  //     ),
  //     (route) => false,
  //   );
  // }

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
