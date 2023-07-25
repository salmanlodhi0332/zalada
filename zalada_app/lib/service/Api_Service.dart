import 'package:dio/dio.dart';
import 'package:zalada_app/dummyData/product_dummyData.dart';
import 'package:zalada_app/utiles/shared_preferences.dart';
import '../MVC/model/product_model.dart';
import '../utiles/constent.dart';

final dio = Dio();

class ApiService {
  static ApiService? _instance;
  static ApiService get getInstance => _instance ??= ApiService();

  static const String baseURL = "${Constants.baseURL}/api/v1/";

  static String AuthUserToken = shared_preferences.userToken.value;

  getAllproducts() async {
    try {
      Response response;
      // response =
      //     await dio.get('${baseURL}bookings/customer?status=$Status&$pageNo',
      //         options: Options(
      //           headers: {
      //             'Authorization': 'Bearer $AuthUserToken',
      //           },
      //         ));

      // print("statusCode => " + response.statusCode.toString());
      // print('getAllproducts API done 👌✅');
      // // if (response.statusCode == 200) {
      //   final responseData = ;
      //   if (responseData is List) {
      //     List<Product_Model> Bookinglist = (response.data as List)
      //         .map((data) => Product_Model.fromJson(data))
      //         .toList();
      //     return Bookinglist;
      //   } else if (responseData is Map) {
      //     List<Product_Model> Bookinglist =
      //         (responseData['bookings'] as List)
      //             .map((data) => Product_Model.fromJson(data))
      //             .toList();
      //     return Bookinglist;
      //   // } else {
      //   //   throw Exception('Failed to load posts: ${response.statusCode}');
      //   // }
      // }
      return product_dummyData.dummyProducts;
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      return [];
    }
  }
}
