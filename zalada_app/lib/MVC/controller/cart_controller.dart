import 'package:get/get.dart';
import '../model/product_model.dart';

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
