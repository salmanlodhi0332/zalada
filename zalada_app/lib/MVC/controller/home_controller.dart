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
  RxList<Product_Model> Productslist = <Product_Model>[].obs;
  RxList<Product_Model> hotdeal_list = <Product_Model>[].obs;
  RxList<categories_Model> categoriesList = <categories_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getHomeData();
  }

  getHomeData() async {
    try {
      var ServerResponse = await ApiService.getInstance.getHomeData();
      // Productslist.value = ServerResponse;
      // categoriesList.value = ServerResponse;
      // hotdeal_list.value = ServerResponse;
    } catch (e) {
      print('get Home Data error: $e');
    }
  }

  getAllproducts() async {
    try {
      isLoading(true);
      var ServerResponse = await ApiService.getInstance.getAllproducts();
      Productslist.value = ServerResponse;
    } catch (e) {
      print('get All products  error: $e');
    } finally {
      isLoading(false);
    }
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
