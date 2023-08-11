import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/Api_Service.dart';
import '../model/product_model.dart';

class cart_Controller extends GetxController {
  RxList cartproductlist = [].obs;
    final product_youlike_list = [].obs;
  final islikeLoading = false.obs;

  
  @override
  void onInit() {
    super.onInit();
    getproductLike();
  }

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

  Future<void> addCart(Product_Model ProductsData, BuildContext context) async {
    try {
      
      var ServerResponse = await ApiService.getInstance
          .AddOrRemoveCart(ProductsData.id, 'Add', context);
      getuserCart();
    } catch (e) {
      print('addCart error: $e');
    }
  }

  Future<void> removeCart(
      Product_Model ProductsData, BuildContext context) async {
    try {
      var ServerResponse = await ApiService.getInstance
          .AddOrRemoveCart(ProductsData.id, 'removed', context);
      getuserCart();
    } catch (e) {
      print('removeCart error: $e');
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
  
  getproductLike() async {
    try {
      islikeLoading(true);
      var ServerResponse = await ApiService.getInstance.getproductLike();
      product_youlike_list.value = ServerResponse;
    } catch (e) {
      print('getAllCategories  error: $e');
    } finally {
      islikeLoading(false);
    }
  }

}
