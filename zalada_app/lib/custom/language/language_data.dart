import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:zalada_app/MVC/model/language_model.dart';

class Language_data {
  static List<Language_Model> langauges = [
    Language_Model(
        id: 1,
        label: 'English(US)'.tr,
        prefixIcon: 'assets/icon/English(US).png',
        lancode: 'en',
        countrycode: 'US'),
    Language_Model(
        id: 2,
        label: 'indonesia'.tr,
        prefixIcon: 'assets/icon/Indonesia.png',
        lancode: 'id',
        countrycode: 'ID'),
    Language_Model(
        id: 3,
        label: 'thailand'.tr,
        prefixIcon: 'assets/icon/Thailand.png',
        lancode: 'th',
        countrycode: 'TH'),
    Language_Model(
        id: 4,
        label: 'chinese'.tr,
        prefixIcon: 'assets/icon/Chinese.png',
        lancode: 'zh',
        countrycode: 'CN'),
  ];
}
