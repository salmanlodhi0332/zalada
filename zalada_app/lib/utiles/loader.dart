import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Loader {
  static poploader() {
    Get.dialog(SpinKitFadingCircle(
      color: Color.fromARGB(255, 9, 201, 12).withOpacity(0.3),
      size: 50.0,
      duration: Duration(seconds: 2),
    ));
  }
}
