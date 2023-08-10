import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/payment_model.dart';
import '../model/shiping_model.dart';

final dio = Dio();

class Shiping_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Shiping_Model> shipingList = <Shiping_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getShiping();
  }

  getShiping() async {
    try {
      isLoading.value = true;
      var ServerResponse = await ApiService.getInstance.getShiping();
      shipingList.value = ServerResponse;
    } catch (e) {
      print('getShiping error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
