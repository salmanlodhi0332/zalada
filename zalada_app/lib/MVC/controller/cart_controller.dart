import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/Api_Service.dart';
import '../model/product_model.dart';

class cart_Controller extends GetxController {
  var cartproductlist = {}.obs;

  //

  final product_youlike_list = [].obs;
  final islikeLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getproductLike();
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

  void addProduct(Product_Model dummyProducts) {
    if (cartproductlist.containsKey(dummyProducts)) {
      cartproductlist[dummyProducts] += 1;
    } else {
      cartproductlist[dummyProducts] = 1;
    }
  }
  //

  Future<void> addtoCart(
      Product_Model ProductsData, BuildContext context) async {
    try {
      var ServerResponse =
          await ApiService.getInstance.AddtoCart(ProductsData.id, context);
    } catch (e) {
      print('getAddress error: $e');
    }
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
