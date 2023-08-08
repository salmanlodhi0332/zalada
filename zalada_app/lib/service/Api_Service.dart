import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import 'package:zalada_app/MVC/model/help_center_model.dart';
import 'package:zalada_app/MVC/model/home_model.dart';
import 'package:zalada_app/MVC/views/Address_Screen.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/MVC/views/payment_method.dart';
import 'package:zalada_app/dummyData/product_dummyData.dart';
import 'package:zalada_app/utiles/shared_preferences.dart';
import '../MVC/model/payment_model.dart';
import '../MVC/model/privacy_policy_model.dart';
import '../MVC/model/product_model.dart';
import '../MVC/model/categories_model.dart';
import '../MVC/model/wishlist_model.dart';
import '../utiles/constent.dart';
import '../utiles/loader.dart';
import '../utiles/page_navigation.dart';

final dio = Dio();

class ApiService {
  static ApiService? _instance;
  static ApiService get getInstance => _instance ??= ApiService();

  static const String baseURL = "${Constants.baseURL}/api/v1/";

  static String AuthUserToken = shared_preferences.userToken.value;

  getAllproducts(int page) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.get('${baseURL}products?page=${page}',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

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
          List<Product_Model> Productlist = (responseData['data'] as List)
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

  getAllwishlist() async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.get('${baseURL}wishlist',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('getAllwishlist API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Wishlist_model> Wishlist = (response.data as List)
              .map((data) => Wishlist_model.fromJson(data))
              .toList();
          return Wishlist;
        } else if (responseData is Map) {
          List<Wishlist_model> Wishlist = (responseData['data'] as List)
              .map((data) => Wishlist_model.fromJson(data))
              .toList();
          return Wishlist;
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

  Add_Wishlist(Wishlist_model data, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.post('${baseURL}wishlist',
          data: {
            'product_ids': data.productId,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 201) {
        print("Wishlist are succesfully Added");
        Get.snackbar('Wishlist', "Added",
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        // Page_Navigation.getInstance.Page(context, Address_Screen());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Wishlist  ${e.response?.data['message']}");
      // Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
      //     colorText: Theme.of(context).secondaryHeaderColor,
      //     backgroundColor: Theme.of(context).cardColor);
    }
  }

  Add_Address(Address_Model data, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.post('${baseURL}address/',
          data: {
            'locationName': data.locationname,
            'address': data.address,
            'lat': double.parse(data.latitude),
            'long': double.parse(data.longitude),
            'address_type': data.addressType,
            'user_id': data.userid
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 201) {
        print("Address are succesfully Created");
        Get.snackbar('Address'.tr, "address_created".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        // Get.back();

        Page_Navigation.getInstance.Page(context, Address_Screen());
        // Page_Navigation.getInstance.Page(
        //     context,
        //     Bottom_Bar(
        //       initialIndex: 4,
        //     ));
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Address  ${e.response?.data['message']}");
      Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
    }
  }

// Add Payment Work starts from here,
  Add_payment(Payment_model data, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.post('${baseURL}payment-card',
          data: {
            'cardName': data.CardName,
            'card_number': data.CardNumber,
            "expire_date": data.Expire_date,
            'Cvv': data.Cvv,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 201) {
        print("payment are succesfully added");
        Get.snackbar('Payment'.tr, "Payment_added".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);

        Page_Navigation.getInstance.Page(context, payment_method());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Payment  ${e.response?.data['message']}");
      Get.snackbar('Payment_field'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
    }
  }

  // Update_payment(Payment_model data, BuildContext context) async {
  //   try {
  //     Loader.poploader();
  //     Response response;
  //     response = await dio.patch('${baseURL}payment/',
  //         data: {
  //           'CardName': data.CardName,
  //           'CardNumber': data.CardNumber,
  //           'Cvv': data.Cvv,
  //         },
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $AuthUserToken',
  //           },
  //         ));
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       print("Payments updated");
  //       Get.snackbar('payment'.tr, "Payment_updated".tr,
  //           colorText: Theme.of(context).hintColor,
  //           backgroundColor: Theme.of(context).cardColor);
  //       // Page_Navigation.getInstance.Page(
  //       //     context,
  //       //     Bottom_Bar(
  //       //       initialIndex: 4,
  //       //     )
  //       //     );

  //       Page_Navigation.getInstance.Page(context, payment_method());
  //     } else {
  //       Get.snackbar('error'.tr, response.data['message'],
  //           colorText: Theme.of(context).hintColor,
  //           backgroundColor: Theme.of(context).cardColor);
  //     }
  //   } on DioException catch (e) {
  //     Get.back();
  //     print("Payment  ${e.response?.data['message']}");
  //     Get.snackbar('payment_failed'.tr, "${e.response?.data['message']}",
  //         colorText: Theme.of(context).hintColor,
  //         backgroundColor: Theme.of(context).cardColor);
  //   }
  // }

// and on work add payment

  Update_Address(Address_Model data, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.patch('${baseURL}address/${data.id}',
          data: {
            'locationName': data.locationname,
            'address': data.address,
            'lat': double.parse(data.latitude),
            'long': double.parse(data.longitude),
            'address_type': data.addressType,
            'user_id': data.userid
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 200) {
        print("Update are succesfully Created");
        Get.snackbar('Address'.tr, "address_upated".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);

        Page_Navigation.getInstance.Page(context, Address_Screen());
        // Page_Navigation.getInstance.Page(
        //     context,
        //     Bottom_Bar(
        //       initialIndex: 4,
        //     ));
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Address  ${e.response?.data['message']}");
      Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
    }
  }

  Delete_Address(int id, BuildContext context) async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.delete('${baseURL}address/${id}',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 200) {
        print("Address  are succesfully Deleted");
        Get.snackbar('Address'.tr, "address_delete".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        // Get.to(() => Bottom_Bar(), arguments: 4);
        // Page_Navigation.getInstance
        // .Page_pushAndRemoveUntil(context, Address_Screen());
        Page_Navigation.getInstance.Page(context, Address_Screen());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Address  ${e.response?.data['message']}");
      Get.snackbar('address_failed'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).secondaryHeaderColor,
          backgroundColor: Theme.of(context).cardColor);
    }
  }

  getAddress() async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.get('${baseURL}address/',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

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

  getPrivacy() async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.get(
        '${baseURL}privacy-policies/',
        // options: Options(
        //   // headers: {
        //   //   'Authorization': 'Bearer $AuthUserToken',
        //   // },
        // )
      );

      print("statusCode => " + response.statusCode.toString());
      print('getPrivacy  API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Privacy_model> privacyData = (response.data as List)
              .map((data) => Privacy_model.fromJson(data))
              .toList();
          return privacyData;
        } else if (responseData is Map) {
          List<Privacy_model> privacyData = (responseData['data'] as List)
              .map((data) => Privacy_model.fromJson(data))
              .toList();
          return privacyData;
        }
        return responseData;
      }
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      // return [];
    }
  }

  gethelpcenter() async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.get(
        '${baseURL}privacy-policies/',
        // options: Options(
        //   // headers: {
        //   //   'Authorization': 'Bearer $AuthUserToken',
        //   // },
        // )
      );

      print("statusCode => " + response.statusCode.toString());
      print('getHelpCenter  API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Help_center_model> helpcenterData = (response.data as List)
              .map((data) => Help_center_model.fromJson(data))
              .toList();
          return helpcenterData;
        } else if (responseData is Map) {
          List<Help_center_model> helpcenterData =
              (responseData['data'] as List)
                  .map((data) => Help_center_model.fromJson(data))
                  .toList();
          return helpcenterData;
        }
        return responseData;
      }
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      // return [];
    }
  }

  getAllCategories() async {
    try {
      Loader.poploader();
      Response response;
      response = await dio.get('${baseURL}categories/',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('get All Categories  API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<categories_Model> CategoriesData = (response.data as List)
              .map((data) => categories_Model.fromjson(data))
              .toList();
          return CategoriesData;
        } else if (responseData is Map) {
          List<categories_Model> CategoriesData = (responseData['data'] as List)
              .map((data) => categories_Model.fromjson(data))
              .toList();
          return CategoriesData;
        }
        return responseData;
      }
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      return [];
    }
  }
}
