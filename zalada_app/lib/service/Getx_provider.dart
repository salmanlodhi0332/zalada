import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zalada_app/service/Api_Service.dart';

class GetxControllerProvider extends GetxController {
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
}
