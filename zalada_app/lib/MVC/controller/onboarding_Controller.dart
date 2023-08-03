import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import '../../custom/onBoarding_page_widget.dart';
import '../../utiles/shared_preferences.dart';
import '../model/onBoarding_model.dart';

import '../views/login_screen.dart';
import '../views/onboarding/onBoarding_Strings.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() =>
      controller.animateToPage(page: controller.currentPage + 1);

  // onPageChangedCallback(int activePageIndex) =>
  //     currentPage.value = activePageIndex;

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;

    if (activePageIndex >= pages.length - 1) {
      isloggedcheck();
      // Get.offAll(login_screen());
    }
  }

  String? token;
  isloggedcheck() async {
    BuildContext context;
    SharedPreferences instance = await SharedPreferences.getInstance();
    token = instance.getString("token");
    if (token != null) {
      var _pref = shared_preferences();
      await _pref.Get_userData();
      //
      Get.to(Bottom_Bar());
      // Page_Navigation.getInstance
      //     .Page_pushAndRemoveUntil(context, Bottom_Bar());
      // Get.to(() => Home_Bottom_Bar());
    } else {
      Get.to(login_screen());
      // Page_Navigation.getInstance
      //     .Page_pushAndRemoveUntil(context, login_screen());
      // Get.to(() => Login_Screen());
    }
  }

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage1,
        title: tOnBoardingTitle1,
        subTitle: tOnBoardingSubTitle1,
        counterText: tOnBoardingCounter1,
        bgColor: tOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage2,
        title: tOnBoardingTitle2,
        subTitle: tOnBoardingSubTitle2,
        counterText: tOnBoardingCounter2,
        bgColor: tOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage3,
        title: tOnBoardingTitle3,
        subTitle: tOnBoardingSubTitle3,
        counterText: tOnBoardingCounter3,
        bgColor: tOnBoardingPage3Color,
      ),
    ),
  ];
}