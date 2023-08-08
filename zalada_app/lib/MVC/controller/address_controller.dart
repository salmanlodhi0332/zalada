import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';

final dio = Dio();

class Address_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Address_Model> AddressList = <Address_Model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }

  getAddress() async {
    try {
      // isLoading.value = true;
      var ServerResponse = await ApiService.getInstance.getAddress();
      AddressList.value = ServerResponse;
    } catch (e) {
      print('getAddress error: $e');
    } finally {
      // isLoading.value = false;
    }
  }
}
