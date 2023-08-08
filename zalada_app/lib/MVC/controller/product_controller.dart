import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/product_model.dart';

final dio = Dio();

class product_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Product_Model> productslist = <Product_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
     //this zero means no category id we are passing
  }

  getAllproducts(int? Category_Id, int pageNo,BuildContext context) async {
    try {
      isLoading(true);

      var ServerResponse =
          await ApiService.getInstance.getAllproducts(Category_Id, pageNo,context);
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
}
