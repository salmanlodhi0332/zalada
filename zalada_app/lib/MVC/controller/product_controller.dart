import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../service/Api_Service.dart';
import '../model/product_model.dart';

// import '../../service/Api_Service.dart';
// import '../../utiles/constent.dart';
// import '../model/product_model.dart';



class product_Controller extends GetxController {
  // static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Product_Model> Productslist = <Product_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    
  }

 
}
