import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChangePasswordController extends GetxController {
  RxString currentPassword = ''.obs;
  RxString newPassword = ''.obs;
  RxString confirmPassword = ''.obs;

  void changePassword() {
    print("New Password: ${newPassword.value}");
    Get.snackbar('Success', 'Password changed successfully');
  }
}
