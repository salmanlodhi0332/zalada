import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/categories_model.dart';
import '../model/home_model.dart';
import '../model/product_model.dart';

final dio = Dio();

class home_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Product_Model> productslist = <Product_Model>[].obs;
  RxList<Product_Model> hotdeal_list = <Product_Model>[].obs;
  RxList<categories_Model> categoriesList = <categories_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getHomeData();
    // getAllproducts();
  }

  getHomeData() async {
    try {
      var ServerResponse = await ApiService.getInstance.getHomeData();
      print("ServerResponse object");
      print(ServerResponse);
      var productList = (ServerResponse['allproducts'] as List<dynamic>)
          .map<Product_Model>((data) => Product_Model.fromjson(data))
          .toList();
      productslist.value = productList;

      print(productslist.value);

      var hotList = (ServerResponse['hotdeals'] as List<dynamic>)
          .map<Product_Model>((data) => Product_Model.fromjson(data))
          .toList();
      hotdeal_list.value = hotList;

      print(hotdeal_list.value);

      var cateroryList = (ServerResponse['categories'] as List<dynamic>)
          .map<categories_Model>((data) => categories_Model.fromjson(data))
          .toList();

      categoriesList.value = cateroryList;

      print(categoriesList.value);
    } catch (e) {
      print('get Home Data error: $e');
    }
  }

  getAllproducts(int? Category_Id, int pageNo) async {
    try {
      isLoading(true);

      var ServerResponse =
          await ApiService.getInstance.getAllproducts(Category_Id, pageNo);
      if (pageNo > 1) {
        // productslist.addAll(ServerResponse);
        productslist.value.addAll(ServerResponse);
      } else {
        productslist.value = ServerResponse;
      }
    } catch (e) {
      print('getAllproducts abcdefghjk  error: $e');
    } finally {
      // isLoading(false);
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
