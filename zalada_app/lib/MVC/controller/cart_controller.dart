import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/Api_Service.dart';
import '../model/product_model.dart';

class cart_Controller extends GetxController {
  RxList cartproductlist = [].obs;
  Future<void> addtoCart(
      Product_Model ProductsData, BuildContext context) async {
    try {
      var ServerResponse =
          await ApiService.getInstance.AddtoCart(ProductsData.id, context);
      getuserCart();
    } catch (e) {
      print('getAddress error: $e');
    }
  }

  getuserCart() async {
    try {
      // isLoading.value = true;
      var ServerResponse = await ApiService.getInstance.getuserCart();
      cartproductlist.clear();
      cartproductlist.value = ServerResponse;
    } catch (e) {
      print('getAddress error: $e');
    } finally {
      // isLoading.value = false;
    }
  }

  Future<void> addorRemoveCart(
      Product_Model ProductsData, BuildContext context) async {
    try {
      var ServerResponse =
          await ApiService.getInstance.AddtoCart(ProductsData.id, context);
    } catch (e) {
      print('getAddress error: $e');
    }
  }
}
