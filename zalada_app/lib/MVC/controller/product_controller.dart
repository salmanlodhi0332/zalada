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
    getAllproducts();
  }

  getAllproducts() async {
    try {
      isLoading(true);
      var ServerResponse = await ApiService.getInstance.getAllproducts();
      Productslist.value = ServerResponse;
    } catch (e) {
      print('getAllproducts  error: $e');
    } finally {
      isLoading(false);
    }
  }
}

class cart_Controller extends GetxController {
  var cartproductlist = {}.obs;
  void addProduct(Product_Model dummyProducts) {
    if (cartproductlist.containsKey(dummyProducts)) {
      cartproductlist[dummyProducts] += 1;
    } else {
      cartproductlist[dummyProducts] = 1;
    }

    Get.snackbar("Product Added", "You have added the product",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  void removeProduct(Product_Model dummyProducts) {
    if (cartproductlist.containsKey(dummyProducts) &&
        cartproductlist[dummyProducts] == 1) {
      cartproductlist.removeWhere((key, value) => key == dummyProducts);
    } else {
      cartproductlist[dummyProducts] -= 1;
    }

    Get.snackbar("Product Removed", "You have removed the product",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  void removeCartItem(Product_Model product) {
    cartproductlist.remove(product);
  }

  get products => cartproductlist;
}
