import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import 'package:zalada_app/MVC/views/Address_Screen.dart';
import 'package:zalada_app/dummyData/product_dummyData.dart';
import 'package:zalada_app/utiles/shared_preferences.dart';
import '../MVC/model/product_model.dart';
import '../utiles/constent.dart';
import '../utiles/loader.dart';
import '../utiles/page_navigation.dart';

final dio = Dio();

class ApiService {
  static ApiService? _instance;
  static ApiService get getInstance => _instance ??= ApiService();

  static const String baseURL = "${Constants.baseURL}/api/v1/";

  static String AuthUserToken = shared_preferences.userToken.value;

  getAllproducts() async {
    try {
      Response response;
      response = await dio.get(
        '${baseURL}products',
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $AuthUserToken',
        //   },
        // )
      );

      print("statusCode => " + response.statusCode.toString());
      print('getAllproducts API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Product_Model> Productlist = (response.data as List)
              .map((data) => Product_Model.fromjson(data))
              .toList();
          return Productlist;
        } else if (responseData is Map) {
          List<Product_Model> Productlist = (responseData['products'] as List)
              .map((data) => Product_Model.fromjson(data))
              .toList();
          return Productlist;
          // } else {
          //   throw Exception('Failed to load posts: ${response.statusCode}');
          // }
        }
      }
      // return product_dummyData.dummyProducts;
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      return [];
    }
  }

  Add_Address(Address_Model data, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.post(
        '${baseURL}address/',
        data: {
          'locationName': data.locationname,
          'address': data.address,
          'lat': double.parse(data.latitude),
          'long': double.parse(data.longitude),
          'address_type': data.addressType,
          'user_id': data.userid
        },
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $AuthUserToken',
        //   },
        // )
      );
      print(response.data);
      if (response.statusCode == 201) {
        print("Address are succesfully Created");
        Get.snackbar('Address'.tr, "address_created".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        Page_Navigation.getInstance.Page(context, Address_Screen());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Address  ${e.response?.data['message']}");
      // Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
      //     colorText: Theme.of(context).secondaryHeaderColor,
      //     backgroundColor: Theme.of(context).cardColor);
    }
  }

  Update_Address(Address_Model data, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.patch(
        '${baseURL}address/${data.id}',
        data: {
          'locationName': data.locationname,
          'address': data.address,
          'lat': double.parse(data.latitude),
          'long': double.parse(data.longitude),
          'address_type': data.addressType,
          'user_id': data.userid
        },
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $AuthUserToken',
        //   },
        // )
      );
      print(response.data);
      if (response.statusCode == 200) {
        print("Update are succesfully Created");
        Get.snackbar('Address'.tr, "address_upated".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        Page_Navigation.getInstance.Page(context, Address_Screen());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Address  ${e.response?.data['message']}");
      // Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
      //     colorText: Theme.of(context).secondaryHeaderColor,
      //     backgroundColor: Theme.of(context).cardColor);
    }
  }

  Delete_Address(int id, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.delete(
        '${baseURL}address/${id}',

        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $AuthUserToken',
        //   },
        // )
      );
      print(response.data);
      if (response.statusCode == 200) {
        print("Address  are succesfully Deleted");
        Get.snackbar('Address'.tr, "address_delete".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        Page_Navigation.getInstance.Page(context, Address_Screen());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Address  ${e.response?.data['message']}");
      // Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
      //     colorText: Theme.of(context).secondaryHeaderColor,
      //     backgroundColor: Theme.of(context).cardColor);
    }
  }

  getAddress() async {
    try {
      Response response;
      response = await dio.get(
        '${baseURL}address/',
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $AuthUserToken',
        //   },
        // )
      );

      print("statusCode => " + response.statusCode.toString());
      print('get Address  API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Address_Model> addressData = (response.data as List)
              .map((data) => Address_Model.fromJson(data))
              .toList();
          return addressData;
        } else if (responseData is Map) {
          List<Address_Model> addressData = (responseData['data'] as List)
              .map((data) => Address_Model.fromJson(data))
              .toList();
          return addressData;
        }
        return responseData;
      }
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      // return [];
    }
  }
}
