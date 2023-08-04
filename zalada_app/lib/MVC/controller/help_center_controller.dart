import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../model/help_center_model.dart';
import '../model/privacy_policy_model.dart';

class help_center_controller extends GetxController {
  RxList<Help_center_model> helpcenterlist = <Help_center_model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllhelpcenterdata();
  }

  getAllhelpcenterdata() async {
    try {
      isLoading(true);
      List<Help_center_model> serverResponse =
          await ApiService.getInstance.gethelpcenter();
      if (serverResponse.isNotEmpty) {
        helpcenterlist.assignAll(serverResponse);
      } else {
        // Handle the case where the API returns an empty list
        helpcenterlist.clear();
      }
    } catch (e) {
      print('Error fetching privacy data: $e');
    } finally {
      isLoading(false);
    }
  }
}
