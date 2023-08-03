import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/views/search_product_screen.dart';
import 'package:zalada_app/MVC/views/search_result_screen.dart';
import '../controller/cart_controller.dart';
import '../controller/product_controller.dart';
import 'Explore_Screeen.dart';
import 'Live_Stream_Screen.dart';
import 'profile_screen.dart';
import 'confirm_order.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class Bottom_Bar extends StatefulWidget {
  @override
  _Bottom_BarState createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: Theme.of(context).hoverColor),
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).disabledColor),
        selectedItemColor: Theme.of(context).hoverColor,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedLabelStyle: TextStyle(
            fontFamily: 'plusjakarta',
            color: Theme.of(context).hoverColor,
            fontWeight: FontWeight.w700,
            fontSize: 13),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'plusjakarta',
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // To show all labels
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _currentIndex == 0
                  ? SvgPicture.asset(
                      "assets/svg/homebg.svg",
                      height: 18,
                      width: 18,
                    )
                  : SvgPicture.asset(
                      "assets/svg/home.svg",
                      height: 18,
                      width: 18,
                      color: Theme.of(context).disabledColor,
                    ),
            ),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _currentIndex == 1
                  ? SvgPicture.asset(
                      "assets/svg/searchbg.svg",
                      height: 20,
                      width: 20,
                    )
                  : SvgPicture.asset(
                      "assets/svg/brower.svg",
                      height: 17,
                      width: 17,
                      color: Theme.of(context).disabledColor,
                    ),
            ),
            label: 'explore'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _currentIndex == 2
                  ? SvgPicture.asset(
                      "assets/svg/wishlistbg.svg",
                      height: 20,
                      width: 20,
                    )
                  : SvgPicture.asset(
                      "assets/svg/wishlist.svg",
                      height: 20,
                      width: 20,
                      color: Theme.of(context).disabledColor,
                    ),
            ),
            label: 'live'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _currentIndex == 3
                  ? SvgPicture.asset(
                      "assets/svg/cartbg.svg",
                      height: 22,
                      width: 22,
                    )
                  : SvgPicture.asset(
                      "assets/svg/cart.svg",
                      height: 22,
                      width: 22,
                      color: Theme.of(context).disabledColor,
                    ),
            ),
            label: 'cart'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _currentIndex == 4
                  ? SvgPicture.asset(
                      "assets/svg/profilebg.svg",
                      height: 20,
                      width: 20,
                    )
                  : SvgPicture.asset(
                      "assets/svg/profile.svg",
                      height: 20,
                      width: 20,
                      color: Theme.of(context).disabledColor,
                    ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  final cartController = Get.put(cart_Controller());
  Widget _buildPage(int index) {
    // You can return different widgets/screens based on the index
    switch (index) {
      case 0:
        return Home_Screen();
      case 1:
        return SearchScreen();
      case 2:
        return Live_Stream_Screen();
      case 3:
        return Cart_Screen();
      case 4:
        return Profile_Screen();
      default:
        return Home_Screen();
    }
  }
}
