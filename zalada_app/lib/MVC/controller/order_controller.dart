import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/all_Orders_model.dart';
import '../model/payment_model.dart';

final dio = Dio();

class Order_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<AllOrders_Model> orderList = <AllOrders_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllOrders();
  }

  getAllOrders() async {
    try {
      isLoading.value = true;
      var ServerResponse = await ApiService.getInstance.getAllOrders();
      orderList.value = ServerResponse;
    } catch (e) {
      print('getAllOrders error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
