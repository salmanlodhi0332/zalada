import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:zalada_app/MVC/model/Address_model.dart';
import 'package:zalada_app/MVC/model/wishlist_model.dart';
import 'package:zalada_app/MVC/views/Address_Screen.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/dummyData/product_dummyData.dart';
import 'package:zalada_app/utiles/shared_preferences.dart';
import '../MVC/model/all_Orders_model.dart';
import '../MVC/model/help_center_model.dart';
import '../MVC/model/home_model.dart';
import '../MVC/model/notification_model.dart';
import '../MVC/model/payment_model.dart';
import '../MVC/model/privacy_policy_model.dart';
import '../MVC/model/product_model.dart';
import '../MVC/model/categories_model.dart';
import '../MVC/model/shiping_model.dart';
import '../MVC/views/payment_method.dart';
import '../utiles/constent.dart';
import '../utiles/loader.dart';
import '../utiles/page_navigation.dart';

final dio = Dio();

class ApiService {
  static final Dio dio =
      Dio(BaseOptions(baseUrl: 'http://localhost:3001/api/v1/'));

  static ApiService? _instance;
  static ApiService get getInstance => _instance ??= ApiService();

  static const String baseURL = "${Constants.baseURL}/api/v1/";
  late BuildContext context;
  static String AuthUserToken = shared_preferences.userToken.value;
  static int currentUserId =
      int.parse(shared_preferences.currentUserId.value.toString());

  getnotificatonData() async {
    try {
      Response response;
      response = await dio.get('${baseURL}notifications',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('get notifications API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Notification_Model> notificationlist = (response.data as List)
              .map((data) => Notification_Model.fromJson(data))
              .toList();
          return notificationlist;
        } else if (responseData is Map) {
          List<Notification_Model> notificationlist =
              (responseData['data'] as List)
                  .map((data) => Notification_Model.fromJson(data))
                  .toList();
          return notificationlist;
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

  getproductLike() async {
    try {
      Response response;
      response = await dio.get('${baseURL}products/youmaylike',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('get products you may like API done 👌✅');
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Product_Model> youlikelist = (response.data as List)
              .map((data) => Product_Model.fromjson(data))
              .toList();
          return youlikelist;
        } else if (responseData is Map) {
          List<Product_Model> youlikelist =
              (responseData['recommendedProducts'] as List)
                  .map((data) => Product_Model.fromjson(data))
                  .toList();
          return youlikelist;
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

  getHomeData() async {
    try {
      Response response;
      response = await dio.get('${baseURL}products/homepage',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('get All Home Data API done 👌✅');

      if (response.statusCode == 200) {
        final responseData = response.data;
        print(responseData['data']);

        if (responseData is List) {
          List<Home_Model> homelist = (response.data as List)
              .map((data) => Home_Model.fromjson(data))
              .toList();
          return homelist;
          // }
          //  else if (responseData is Map) {
          //   List<Home_Model> homelist = (responseData['data'] as List)
          //       .map((data) => Home_Model.fromjson(data))
          //       .toList();
          //   return homelist;
          // } else {
          //   throw Exception('Failed to load posts: ${response.statusCode}');
          // }
        } else {
          return responseData['data'];
        }
      }
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
    }
  }

  getAllproducts(int? Category_Id, int page, BuildContext context) async {
    try {
      Response response;

      if (Category_Id == 0) {
        //====get all product
        response = await dio.get('${baseURL}products?page=${page}',
            options: Options(
              headers: {
                'Authorization': 'Bearer $AuthUserToken',
              },
            ));
        print("statusCode => " + response.statusCode.toString());
        print('getAllproducts API done 👌✅');
      } else {
        //====get products By CategoryId
        response = await dio.get(
            '${baseURL}products?page=${page}?categoryId=$Category_Id',
            options: Options(
              headers: {
                'Authorization': 'Bearer $AuthUserToken',
              },
            ));
        print("statusCode => " + response.statusCode.toString());
        print('getproductsByCategoryId API done 👌✅');
      }
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
      Get.snackbar('product_failed'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).secondaryHeaderColor,
          backgroundColor: Theme.of(context).cardColor);

      return [];
    }
  }

  getAllwishlist() async {
    try {
      Response response;
      response = await dio.get('${baseURL}wishlist',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('getAllwishlist API done 👌✅');
      print(response.data);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Product_Model> Wishlist = (response.data as List)
              .map((data) => Product_Model.fromjson(data))
              .toList();
          return Wishlist;
        } else if (responseData is Map) {
          List<Product_Model> Wishlist = (responseData['data'] as List)
              .map((data) => Product_Model.fromjson(data))
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

  Add_Wishlist(int id, BuildContext context) async {
    try {
      Loader.poploader(context);
      Get.back();
      Response response;
      response = await dio.post('${baseURL}wishlist/${id}',
          // data: {
          //   'product_ids': id,
          // },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.data['status'] == 201) {
        print("Wishlist are succesfully Added");
        Get.snackbar('Wishlist', "Added",
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        Page_Navigation.getInstance.Page(context, Bottom_Bar());
      } else if (response.statusCode == 200) {
        print("Wishlist Removed");
        Get.snackbar('Wishlist', "Removed",
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        Page_Navigation.getInstance.Page(context, Bottom_Bar());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Wishlist  ${e.response?.data['message']}");
      Get.snackbar('Add failed'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
    }
  }

  Add_Address(Address_Model data, BuildContext context) async {
    try {
      Loader.poploader(context);
      Response response;
      response = await dio.post('${baseURL}address/',
          data: {
            'location_name': data.locationname,
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
        Page_Navigation.getInstance
            .Page_pushAndRemoveUntil(context, Bottom_Bar());
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

  Update_Address(Address_Model data, BuildContext context) async {
    try {
      Loader.poploader(context);
      Response response;
      response = await dio.patch('${baseURL}address/${data.id}',
          data: {
            'location_name': data.locationname,
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
        Page_Navigation.getInstance
            .Page_pushAndRemoveUntil(context, Bottom_Bar());
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
      Loader.poploader(context);
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
        Page_Navigation.getInstance.Page(context, Bottom_Bar());
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

  getAllCategories() async {
    try {
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

  gethelpcenter() async {
    try {
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

  getuserCart() async {
    try {
      Response response;
      response = await dio.get('${baseURL}carts/',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('getuserCart  API done 👌✅');
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
        }
      }
    } on DioException catch (e) {
      print(e);
      // throw Exception('Failed to load posts: $e');
      // return [];
    }
  }

  AddtoCart(int productId, BuildContext context) async {
    try {
      Loader.poploader(context);
      Response response;
      response = await dio.post('${baseURL}carts/$productId',
          data: {
            'quantity': 1,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print("statusCode => " + response.statusCode.toString());
      print('AddtoCart  API done 👌✅');
      if (response.statusCode == 201) {
        print("Add to cart succesfully ");
        Get.back();
        Get.snackbar('Add_to_cart'.tr, "Add_to_cart_succesfully".tr,
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      Get.snackbar('Payment_field'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
      print("c  ${e.response?.data['message']}");
    }
  }

  AddOrRemoveCart(
      int productId, String action_type, BuildContext context) async {
    try {
      // Loader.poploader(context);
      Response response;
      response = await dio.patch('${baseURL}carts/$productId',
          data: {"action_type": action_type},
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print("statusCode => " + response.statusCode.toString());
      print('AddOrRemoveCart  API done 👌✅');
      if (response.statusCode == 201) {
        Get.back();
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      Get.snackbar('Payment_field'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
      print("c  ${e.response?.data['message']}");
    }
  }

// Add Payment Work starts from here,

  Add_payment(Payment_model data, BuildContext context) async {
    try {
      Loader.poploader(context);
      Response response;
      response = await dio.post('${baseURL}payment-card',
          data: {
            'cardName': data.cardName,
            'card_number': data.cardNumber,
            "expire_date": data.expire_date,
            'Cvv': data.cvv,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 200) {
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

  Update_payment(Payment_model data, BuildContext context) async {
    try {
      Loader.poploader(context);
      Response response;
      response = await dio.patch('${baseURL}payment-card/${data.id}',
          data: {
            'cardName': data.cardName,
            'card_number': data.cardNumber,
            "expire_date": data.expire_date,
            'Cvv': data.cvv,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));
      print(response.data);
      if (response.statusCode == 200) {
        print("Payments updated");

        Get.snackbar('Payment', "Payment Updated",
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
        Page_Navigation.getInstance.Page(context, Bottom_Bar());

        // Page_Navigation.getInstance.Page(context, payment_method());
      } else {
        Get.snackbar('error'.tr, response.data['message'],
            colorText: Theme.of(context).hintColor,
            backgroundColor: Theme.of(context).cardColor);
      }
    } on DioException catch (e) {
      Get.back();
      print("Payment  ${e.response?.data['message']}");
      Get.snackbar('payment_failed'.tr, "${e.response?.data['message']}",
          colorText: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor);
    }
  }

  getAllcards() async {
    try {
      Response response;
      response = await dio.get('${baseURL}payment-card',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('getAllcards API done 👌✅');
      print(response.data);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Payment_model> cardlist = (response.data as List)
              .map((data) => Payment_model.fromJson(data))
              .toList();
          return cardlist;
        } else if (responseData is Map) {
          List<Payment_model> cardlist = (responseData['data'] as List)
              .map((data) => Payment_model.fromJson(data))
              .toList();
          return cardlist;
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

  getShiping() async {
    try {
      Response response;
      response = await dio.get('${baseURL}order/shipping',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('getShiping API done 👌✅');
      print(response.data);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<Shiping_Model> shiplist = (response.data as List)
              .map((data) => Shiping_Model.fromJson(data))
              .toList();
          return shiplist;
        } else if (responseData is Map) {
          List<Shiping_Model> shiplist = (responseData['data'] as List)
              .map((data) => Shiping_Model.fromJson(data))
              .toList();
          return shiplist;
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

  getAllOrders() async {
    try {
      Response response;
      response = await dio.get('${baseURL}order',
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ));

      print("statusCode => " + response.statusCode.toString());
      print('getAllOrders API done 👌✅');
      print(response.data);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is List) {
          List<AllOrders_Model> orderlist = (response.data as List)
              .map((data) => AllOrders_Model.fromjson(data))
              .toList();
          return orderlist;
        } else if (responseData is Map) {
          List<AllOrders_Model> orderlist = (responseData['orders'] as List)
              .map((data) => AllOrders_Model.fromjson(data))
              .toList();
          return orderlist;
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
}
