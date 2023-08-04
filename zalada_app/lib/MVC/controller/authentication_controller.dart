import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/product_controller.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/MVC/views/login_screen.dart';
import 'package:zalada_app/utiles/page_navigation.dart';

import '../../utiles/constent.dart';
import '../../utiles/getxcontroller.dart';
import '../../utiles/loader.dart';
import '../../utiles/shared_preferences.dart';
import '../model/user_model.dart';
import '../views/otp_screen.dart';

class AuthenticationController extends GetxController {
  static const String baseURL = "${Constants.baseURL}/api/v1/";
  final loading = true.obs;
  final hidepassword = true.obs;
  final hidepasswordold = true.obs;
  final hidepasswordconfirm = true.obs;
  final verifyotp = TextEditingController().obs;
  final countrycode = TextEditingController().obs;
  final addresscontroller = TextEditingController().obs;
  final oldpassword = TextEditingController().obs;
  final newpassword = TextEditingController().obs;
  final confrimpassword = TextEditingController().obs;
  final _pref = shared_preferences();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late BuildContext context;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  static String AuthUserToken = shared_preferences.userToken.value;

//----------------------APPLE------------------------------

  Future<void> signUpWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final AuthCredential credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        print('User signed in with Apple: ${user.displayName}');

        final String? email = user.email;
        final String? firstName = appleCredential.givenName;
        final String? lastName = appleCredential.familyName;
        final String name = '${firstName ?? ''} ${lastName ?? ''}';

        final String fcmToken = shared_preferences.fcmToken.value;
        final String deviceId = shared_preferences.DeviceID.value;

        if (email != null && name.isNotEmpty) {
          await sendDataToApi(email, name, fcmToken, deviceId);
        } else {
          print('Email or Name is missing. Unable to send data to API.');
        }

        Get.off(Bottom_Bar());
      } else {
        print('Failed to sign in with Apple.');
      }
    } catch (e) {
      print('Error during Apple sign-in: $e');
    }
  }

  //----------------------LOGIN WITH APPLE---------------------------
  Future<void> loginWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final AuthCredential credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        print('User logged in with Apple: ${user.displayName}');
        print('Email: ${user.email}');

        final String? email = user.email;
        final String? firstName = appleCredential.givenName;
        final String? lastName = appleCredential.familyName;
        final String name = '${firstName ?? ''} ${lastName ?? ''}';

        final String fcmToken = shared_preferences.fcmToken.value;
        final String deviceId = shared_preferences.DeviceID.value;

        if (email != null && name.isNotEmpty) {
          await sendDataToApi(email, name, fcmToken, deviceId);
        } else {
          print('Email or Name is missing. Unable to send data to API.');
        }

        Get.off(Bottom_Bar());
      } else {
        print('Failed to log in with Apple.');
      }
    } catch (e) {
      print('Error during Apple login: $e');
    }
  }

//----------------------SIGN UP WITH Google----------------
  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        print('User signed in with Google: ${user.displayName}');

        final String? email = googleUser.email;
        final String? name = googleUser.displayName;

        final String fcmToken = shared_preferences.fcmToken.value;
        final String deviceId = shared_preferences.DeviceID.value;

        if (email != null && name != null) {
          await sendDataToApi(email, name, fcmToken, deviceId);
        } else {
          print('Email or Name is missing. Unable to send data to API.');
        }

        Get.off(Bottom_Bar()); // Replace 'BottomBar()' with your desired screen
      } else {
        print('Failed to sign in with Google.');
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
    }
  }

  Future<void> sendDataToApi(
    String email,
    String name,
    String fcmToken,
    String deviceId,
  ) async {
    try {
      var dio = Dio();
      var header = {'Content-Type': 'application/json'};
      dio.options.headers = header;

      final url = baseURL + "auth/signup";
      var response = await dio.post(url, data: {
        'name': name,
        'email': email,
        'fcmToken': fcmToken,
        'deviceID': deviceId,
      });

      print(response.statusCode);
      print(response.data.toString());

      if (response.statusCode == 201) {
        final json = response.data;
        print(json);
        if (json['status'] == "success") {
          var token = json['token'];
          print(token);
          _pref.Add_token(token);
          Get.to(const login_screen());
        } else {
          throw jsonDecode(response.data)['message'] ??
              "Unknown Error Occurred";
        }
      } else {
        throw jsonDecode(response.data)['message'] ??
            "Unknown Error Status Occurred";
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print("Error sending data: ${e.response!.data['message']}");
      } else {
        print("Error sending data: $e");
      }

      throw e;
    }
  }
//------------------------Login with google-----------

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        print('User signed in with Google: ${user.displayName}');
        print('Email: ${user.email}');
        print('User ID: ${user.uid}');

        final String? email = googleUser.email;
        final String? name = googleUser.displayName;

        if (email != null && name != null) {
          await sendloginDataToApi(
            email,
          );
        } else {
          print('Email is missing. Unable to send data to API.');
        }

        // Get.off(Bottom_Bar());
      } else {
        print('Failed to sign in with Google.');
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
    }
  }

  Future<void> sendloginDataToApi(String email) async {
    try {
      String fcmToken = shared_preferences.fcmToken.toString();
      String deviceId = shared_preferences.DeviceID.toString();
      print(fcmToken);
      print(deviceId);

      var header = {'Content-Type': 'application/json'};
      var dio = Dio(BaseOptions(headers: header));

      final url = baseURL + "auth/login";
      var response = await dio.post(
        url,
        data: {
          'email': email,
          'fcmToken': fcmToken,
          'deviceID': deviceId,
        },
      );

      print(response.statusCode);
      print(response.data.toString());

      if (response.statusCode == 200) {
        final json = response.data;
        var token = json['token'];
        print(token);

        _pref.Add_token(token);

        Get.to(Bottom_Bar());
      } else {
        print('Login failed: ${response.data}');
      }
    } on DioError catch (e) {
      print("💥 Error: ${e.response?.data['message']}");
    } catch (e) {
      print("💥 Error: $e");
    }
  }

//---------------------------LOGIN

  Future<void> loginwithEmail(
      String email, String? password, BuildContext context) async {
    try {
      // Loader.poploader();
      String fcmToken = shared_preferences.fcmToken.toString();
      String deviceId = shared_preferences.DeviceID.toString();
      print(fcmToken);
      print(deviceId);
      var header = {'Content-Type': 'application/json'};
      var dio = Dio(BaseOptions(headers: header));
      final url = baseURL + "auth/login";
      var response = await dio.post(url, data: {
        //'mobile_number': mobile_number,
        'email': email,
        'password': password!,
        'fcmToken': fcmToken,
        'deviceID': deviceId
      });

      if (response.statusCode == 200) {
        print(response.data['token'].toString());
        print(response.data['status'].toString());
        final json = response.data;
        print("User Name" + response.data['data']['user']['name'].toString());
        if (json['status'] == "success") {
          var token = json['token'];
          var id = response.data['data']['user']['id'];
          // var name = response.data['data']['user']['fullName'];
          var name = json['data']['user']['name'].toString();
          var email = json['data']['user']['email'].toString();
          var phone = json['data']['user']['phone_number'].toString();
          //var address = json['data']['user']['address'].toString();
          var image = json['data']['user']['image'].toString();
          print(id);
          print(token);
          print(name);
          print(email);
          print(phone);
          // print(address);
          print(image);

          await _pref.insert_userData(
            id: id,
            name: name,
            email: email,
            image: image,
            phone: phone,
            token: token,
            // address: address
          );
          // var getxController = getx_GetController();
          //getxController.GetMessageOfuser();
          //SocketIOClient.getInstance.connectUsertosockit();
          Page_Navigation.getInstance
              .fromleftPage_PushAndReplaceNavigation(context, Bottom_Bar());
          Get.snackbar('welcome'.tr, "welcome_des".tr,
              backgroundColor: Theme.of(context).cardColor,
              colorText: Theme.of(context).hintColor);
        } else {
          print(json['message'] ?? "Unknown Error Occured");
          // throw json['message'] ?? "Unknown Error Occured";
        }
      } else {
        // throw jsonDecode(response.data)['message'] ??
        //     "Unknown Error status Occured";
        // print(jsonDecode(response.data)
        // ['message'] ??
        //     "Unknown Error status Occured");
      }
    } on DioException catch (e) {
      print(e);
      // print("Login Error  ${e.response?.data['message']}");
      // Get.back();
      Get.snackbar('login_failed'.tr, "${e.response?.data['message']}",
          backgroundColor: Theme.of(context).cardColor,
          colorText: Theme.of(context).hintColor);
    }
  }

//---------------------------REGISTERATION

  Future<void> registerUser(String name, String email, String? phone,
      String? password, BuildContext context) async {
    try {
      String fcmToken = shared_preferences.fcmToken.toString();
      String deviceId = shared_preferences.DeviceID.toString();
      print(fcmToken);
      print(deviceId);
      // Loader.poploader();
      var header = {'Content-Type': 'application/json'};
      var dio = Dio(BaseOptions(headers: header));
      final url = baseURL + "auth/signup";
      var response = await dio.post(url, data: {
        'name': name,
        'email': email,
        'password': password,
        'phone_number': phone,
        'fcmToken': fcmToken,
        'deviceID': deviceId
      });
      print(response.statusCode);
      print(response.data.toString());

      if (response.statusCode == 201) {
        print("here");
        print(response.data['token'].toString());
        print(response.data['status'].toString());
        final json = response.data;
        print(json);
        if (json['status'] == "success") {
          var token = json['token'];
          print(token);
          _pref.Add_token(token);
//SnakeBar Message
//then Navigate the home screen
          Get.to(const login_screen());
        } else {
          throw jsonDecode(response.data)['message'] ??
              "Unknown Error Occurred";
        }
      } else {
        throw jsonDecode(response.data)['message'] ??
            "Unknown Error status Occurred";
      }
    } on DioException catch (e) {
      print("💥 Errro :${e.response?.data['message']}");

      Get.snackbar('registration_failed'.tr, "${e.response?.data['message']}",
          backgroundColor: Theme.of(context).cardColor,
          colorText: Theme.of(context).hintColor);
    }
  }

//---------------------------SEND OTP

  Future<void> mobileotp_Send(
      String name, String email, String password, var number) async {
    auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (_) {
          loading.value = !loading.value;
        },
        verificationFailed: (e) {
          loading.value = !loading.value;
          print(e.toString());
          // Get.snackbar('Error', e.toString());
        },
        codeSent: (String verificationId, int? Token) {
          loading.value = !loading.value;
          Get.to(() => OTP_Screen(
                verfiyId: verificationId,
                phone: number,
                name: name,
                email: email,
                password: password,
              ));
        },
        codeAutoRetrievalTimeout: (e) {
          loading.value = !loading.value;
          print(e.toString());
        });
  }

  //---------------------------VERIFICATION

  Future<void> otp_verification(String verifyotp, String verifyId, String name,
      String email, String phone, String password, BuildContext context) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: verifyId, smsCode: verifyotp);
    try {
      // Loader.poploader();
      await auth.signInWithCredential(credential).then((value) {
        print(name);
        print(email);
        print(phone);

        registerUser(name, email, phone, password, context).then((value) {
          // Get.snackbar()
          print('Data Store Succefully');
        }).onError((error, stackTrace) {
          Get.snackbar('error'.tr, error.toString(),
              backgroundColor: Theme.of(context).cardColor,
              colorText: Theme.of(context).hintColor);
          print('Error on Registration function' + error.toString());
        });
        // Get.to(() => Home_Bottom_Bar());
        // );
      }).onError((error, stackTrace) {
        print(error.toString());
        // Get.snackbar('Error', error.toString());
      });
    } catch (e) {
      loading.value = !loading.value;
      print(e.toString());
      // Get.snackbar('Error', e.toString());
    }
  }

//------------------------------  UPDATE PROFILE
  Future<void> updateProfile(UserModel userdata, context) async {
    try {
      Loader.poploader();
      final response;

      if (userdata.userimage != "") {
        final formData = FormData();
        formData.fields.add(MapEntry('name', userdata.name));
        formData.fields.add(MapEntry('email', userdata.email));
        formData.fields.add(MapEntry('DOB', userdata.dateofbrith));
        formData.fields.add(MapEntry('image', userdata.userimage)); //image
        formData.fields.add(MapEntry('phone_number', userdata.phone_number));
        formData.files.add(MapEntry(
          'files',
          await MultipartFile.fromFile(userdata.userimage),
        ));
        response = await dio.patch(
          baseURL + 'users/',
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ),
        );
      } else {
        response = await dio.patch(
          baseURL + 'users/updateUser',
          data: {
            'name': userdata.name,
            'email': userdata.email,
            'DOB': userdata.name,
            'phone_number': userdata.email,
            'image': userdata.userimage,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ),
        );
      }
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.statusCode);
        Get.snackbar('profile_Updated'.tr, "profile_updated_Successfully".tr,
            backgroundColor: Theme.of(context).cardColor,
            colorText: Theme.of(context).hintColor);
        print('Print Successfully');
        var userData = UserModel(
          name: response.data['data']['name'].toString(),
          email: response.data["data"]["email"].toString(),
          password: response.data["data"]["password"].toString(),
          phone_number: response.data["data"]["phone_number"].toString(),
          userimage: response.data["data"]["image"].toString(),
          fcm: response.data["data"]["fcm"].toString(),
          gender: response.data["data"]["gender"].toString(),
          dateofbrith: response.data["data"]["DOB"].toString(),
        );

        // _pref.update_userData(userData);
        // Get.back();
        Get.to(Bottom_Bar());
      } else {
        print('something wrong......');
      }
      print('Api Hit  ');

      // Handle response here (e.g., show success message)
      // You can access response data using response.data
      // Example: final responseData = response.data;
    } on DioException catch (e) {
      print("💥 Errro :${e.response?.data['message']}");
      Get.snackbar('profile_Update_failed'.tr, "${e.response?.data['message']}",
          backgroundColor: Theme.of(context).cardColor,
          colorText: Theme.of(context).hintColor);
    }
  }

//------------------------------  UPDATE PASSWORD
  Future<void> updatePassword(BuildContext context) async {
    try {
      if (newpassword.value.text == confrimpassword.value.text) {
        final response = await dio.patch(
          baseURL + 'users/updatePassword',
          data: {
            'passwordCurrent': oldpassword.value.text,
            'newPassword': newpassword.value.text,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $AuthUserToken',
            },
          ),
        );
        print(response.statusCode);
        if (response.statusCode == 200) {
          print(response.statusCode);
          Get.snackbar('update_Password'.tr, "password_updated_Successfully".tr,
              backgroundColor: Theme.of(context).cardColor,
              colorText: Theme.of(context).hintColor);
          print('Print Successfully');
          Get.back();
        } else if (response.statusCode == 401) {
          print(response.statusCode);
          Get.snackbar('wrong_Password'.tr, "incorrect_Password".tr,
              backgroundColor: Theme.of(context).cardColor,
              colorText: Theme.of(context).hintColor);
          print('wrong Password');
        } else {
          print('something wrong......');
          // throw response.data['message'] ?? "Unknown Error Occured";
          print(response.data['message'] ?? "Unknown Error Occured");
        }
        print('Succes =>>');
      } else {
        Get.snackbar('form'.tr, "Password_doesnt_match".tr,
            backgroundColor: Theme.of(context).cardColor,
            colorText: Theme.of(context).hintColor);
      }
    } on DioException catch (e) {
      print("💥 Errro :${e.response?.data['message']}");

      Get.snackbar(
          'password_Update_failed'.tr, "${e.response?.data['message']}",
          backgroundColor: Theme.of(context).cardColor,
          colorText: Theme.of(context).hintColor);
    }
  }

//---------------------------    FORGOT  SEND OTP

//   Future<void> forgot_otp_Send(var number, BuildContext context) async {
//     auth.verifyPhoneNumber(
//         phoneNumber: number,
//         verificationCompleted: (_) {
//           loading.value = !loading.value;
//         },
//         verificationFailed: (e) {
//           loading.value = !loading.value;
//           print(e.toString());
//           // Get.snackbar('Error', e.toString());
//         },
//         codeSent: (
//           String verificationId,
//           int? Token,
//         ) {
//           loading.value = !loading.value;
//           Navigation.getInstance.Page_PushAndReplaceNavigation(
//               context,
//               Forgot_OTP_Page(
//                 verfiyId: verificationId,
//                 phone: number,
//               ));
//         },
//         codeAutoRetrievalTimeout: (e) {
//           loading.value = !loading.value;
//           print(e.toString());
//           // Get.snackbar('Code Time', e.toString());
//         });
//   }

// //---------------------------   FORGOT OTP VERIFICATION
//   void forgot_otp_verify(
//       String verifyId, String phone, BuildContext context) async {
//     final credential = PhoneAuthProvider.credential(
//         verificationId: verifyId, smsCode: verifyotp.value.text);
//     try {
//       // Loader.poploader();
//       await auth.signInWithCredential(credential).then((value) {
//         print(phone);
//         print(verifyId);
//         Navigation.getInstance.Page_PushAndReplaceNavigation(
//             context,
//             ForgotPassword_Set(
//               phone: phone,
//             ));
//       }).onError((error, stackTrace) {
//         print(error.toString());
//         // Get.snackbar('Error', error.toString());
//       });
//     } catch (e) {
//       loading.value = !loading.value;
//       print(e.toString());
//       // Get.snackbar('Error', e.toString());
//     }
//   }

// //---------------------------FORGOT PASSWORD

//   Future<void> forgotpassword(
//       String phone, String password, BuildContext context) async {
//     try {
//       // Loader.poploader();
//       var header = {'Content-Type': 'application/json'};
//       var dio = Dio(BaseOptions(headers: header));
//       final url = baseURL + "users/forgetpassword";
//       var response = await dio.patch(url, data: {
//         'phone': phone,
//         'password': password,
//       });

//       if (response.statusCode == 200) {
//         print(response.data['token'].toString());
//         print(response.data['status'].toString());
//         Navigation.getInstance
//             .Page_PushAndReplaceNavigation(context, const LoginPage());
//       } else {
//         throw jsonDecode(response.data)['message'] ??
//             "Unknown Error status Occured";
//       }
//     } on DioException catch (e) {
//       print("Forgot Error  ${e.response?.data['message']}");
//       Get.back();
//       Get.snackbar('forgot_failed'.tr, "${e.response?.data['message']}",
//           backgroundColor: Theme.of(context).cardColor,
//           colorText: Theme.of(context).hintColor);
//     }
//   }

  logout() {
    _pref.logout();
    Page_Navigation.getInstance.Page(context, login_screen());
  }
}
