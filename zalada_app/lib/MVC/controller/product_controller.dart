import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/product_model.dart';

final dio = Dio();

class product_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Product_Model> Productslist = <Product_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllproducts(0); //this zero means no category id we are passing
  }

  getAllproducts(int? Category_Id) async {
    try {
      isLoading(true);

      var ServerResponse =
          await ApiService.getInstance.getAllproducts(Category_Id);
      Productslist.value = ServerResponse;
    } catch (e) {
      print('getAllproducts  error: $e');
    } finally {
      isLoading(false);
    }
  }
}
