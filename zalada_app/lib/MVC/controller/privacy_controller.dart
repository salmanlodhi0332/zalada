import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../model/privacy_policy_model.dart';

class Privacy_Controller extends GetxController {
  RxList<Privacy_model> privacylist = <Privacy_model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllPrivacy();
  }

  getAllPrivacy() async {
    try {
      isLoading(true);
      List<Privacy_model> serverResponse =
          await ApiService.getInstance.getPrivacy();
      if (serverResponse.isNotEmpty) {
        privacylist.assignAll(serverResponse);
      } else {
        // Handle the case where the API returns an empty list
        privacylist.clear();
      }
    } catch (e) {
      print('Error fetching privacy data: $e');
    } finally {
      isLoading(false);
    }
  }
}
