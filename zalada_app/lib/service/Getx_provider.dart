import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zalada_app/service/Api_Service.dart';

import '../utiles/shared_preferences.dart';

class GetxControllerProvider extends GetxController {
  final _pref = shared_preferences();
  //for languages
  RxInt selectedValueforlang = 0.obs;
// Image picker
  RxString imagePath = ''.obs;
  RxString ChatimagePath = ''.obs;
  var defaultImagePath = 'assets/images/Profile.png';

  // function for image picker starts from here

  Future getImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path.toString();
    } else {
      imagePath.value = '';
    }
  }

  //---------------languages
  void updateSelectedValueForlang(int value) {
    selectedValueforlang.value = value;
    _pref.set_language(value);
  }
}
