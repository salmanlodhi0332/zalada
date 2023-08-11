import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Loader {
  static poploader(BuildContext context) {
    Get.dialog(SpinKitFadingCircle(
      color: Theme.of(context).primaryColor,
      size: 50.0,
      duration: Duration(seconds: 2),
    ));
  }
}
