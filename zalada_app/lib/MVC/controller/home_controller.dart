import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/categories_model.dart';
import '../model/product_model.dart';

final dio = Dio();

class home_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<categories_Model> categoriesList = <categories_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  getAllCategories() async {
    try {
      isLoading(true);
      var ServerResponse = await ApiService.getInstance.getAllCategories();
      categoriesList.value = ServerResponse;
    } catch (e) {
      print('getAllCategories  error: $e');
    } finally {
      isLoading(false);
    }
  }
}
