import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zalada_app/MVC/views/login_screen.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import '../controller/onboarding_Controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tDarkColor = Color(0xff000000);

    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.liquidReveal,
            ignoreUserGestureWhileAnimating: true,
          ),
          // Positioned(
          //   bottom: 60.0,
          //   child: OutlinedButton(
          //     onPressed: () => obController.animateToNextSlide(),
          //     style: ElevatedButton.styleFrom(
          //       side: const BorderSide(color: Colors.black26),
          //       shape: const CircleBorder(),
          //       padding: const EdgeInsets.all(20),
          //       onPrimary: Colors.white,
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.all(20.0),
          //       decoration: const BoxDecoration(
          //           color: tDarkColor, shape: BoxShape.circle),
          //       child: const Icon(Icons.arrow_forward_ios),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Page_Navigation.getInstance
                    .Page_pushAndRemoveUntil(context, login_screen());

                // obController.skip();
              },
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 15,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: obController.currentPage.value,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff272727),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
