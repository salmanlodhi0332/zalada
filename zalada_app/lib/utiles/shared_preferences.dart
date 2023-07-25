import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shared_preferences extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static RxString username = ''.obs;
  static RxString userEmail = ''.obs;
  static RxString userPhoto = ''.obs;
  static RxString useraddress = ''.obs;
  static RxString userphone = ''.obs;
  static RxString userToken = ''.obs;
  static RxString fcmToken = ''.obs;
  static RxString DeviceID = ''.obs;
  static RxString imeiNo = ''.obs;
  static RxString currentUserId = ''.obs;
  static RxInt selectedThemeMode = 0.obs;
  static RxInt selectedlanguage = 0.obs;

  insert_userData({token, id, name, email, phone, photo, address}) async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString('token', token);
    await prefs?.setString('id', id.toString());
    await prefs?.setString('fullName', name);
    await prefs?.setString('email', email);
    await prefs?.setString('phone', phone);
    await prefs?.setString('address', address);
    await prefs?.setString('photo', photo);

    username.value = name;
    userEmail.value = email;
    userPhoto.value = photo;
    useraddress.value = address;
    userphone.value = phone;
    userToken.value = token;
    currentUserId.value = id.toString();
  }

  insert_DeviceAndFCMInformation({
    FcmToken,
    deviceID,
  }) async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString('fcmToken', FcmToken);
    await prefs?.setString('DeviceID', deviceID);

    fcmToken.value = FcmToken;
    DeviceID.value = deviceID;
  }

  update_userData({
    name,
    photo,
  }) async {
    final SharedPreferences? prefs = await _prefs;

    if (photo != "") {
      await prefs?.setString('fullName', name);
      await prefs?.setString('photo', photo);
      username.value = name;
      userPhoto.value = photo;
    } else {
      await prefs?.setString('fullName', name);
      username.value = name;
    }
  }

  Add_token(token) async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString('token', token);
  }

  set_theme(int selectedTheme) async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setInt('ThemeMode', selectedTheme);
    selectedThemeMode.value = selectedTheme;
  }

  set_language(int selectedlang) async {
    final SharedPreferences? prefs = await _prefs;
    await prefs?.setInt('selectedLang', selectedlang);
    selectedlanguage.value = selectedlang;
  }

  Get_userData() async {
    final SharedPreferences? prefs = await _prefs;
    userToken.value = prefs?.getString('token') ?? "";

    username.value = prefs?.getString('fullName') ?? "";

    userEmail.value = prefs?.getString('email') ?? "";

    userPhoto.value = prefs?.getString('photo') ?? "";

    useraddress.value = prefs?.getString('address') ?? "";

    userphone.value = prefs?.getString('phone') ?? "";

    currentUserId.value = prefs?.getString('id') ?? "";

    selectedThemeMode.value = prefs?.getInt('ThemeMode') ?? 0;

    selectedlanguage.value = prefs?.getInt('selectedLang') ?? 0;
  }

  logout() async {
    final SharedPreferences? prefs = await _prefs;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
