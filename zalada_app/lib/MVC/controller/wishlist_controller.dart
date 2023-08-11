import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zalada_app/MVC/model/product_model.dart';
import 'package:zalada_app/MVC/model/wishlist_model.dart';

import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';

final dio = Dio();

class Wishlist_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Product_Model> wishlist = <Product_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllwishlist();
  }

  getAllwishlist() async {
    try {
      isLoading(true);
      var ServerResponse = await ApiService.getInstance.getAllwishlist();
      wishlist.value = ServerResponse;
    } catch (e) {
      print('getAllproducts  error: $e');
    } finally {
      isLoading(false);
    }
  }
}
