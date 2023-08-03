import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class getx_GetController extends GetxController {
  RxInt _countdown = 60.obs;

  int get countdown => _countdown.value;
  RxInt selectedaddress = 0.obs;
  
  // Function to start the countdown
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      if (_countdown.value > 0) {
        _countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
