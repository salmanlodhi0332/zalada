import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import '../../service/Api_Service.dart';
import '../../utiles/constent.dart';
import '../model/payment_model.dart';

final dio = Dio();

class Payment_Controller extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  RxList<Payment_model> PaymentList = <Payment_model>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getpayment();
  }

  getpayment() async {
    try {
      isLoading.value = true;
      var ServerResponse = await ApiService.getInstance.getPrivacy();
      PaymentList.value = ServerResponse;
    } catch (e) {
      print('getpayment error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
