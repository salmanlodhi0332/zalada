import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:zalada_app/views/profile_screen.dart';
import 'package:zalada_app/views/wishlist_cart_screen.dart';

import 'search_product_screen.dart';
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
      // appBar: AppBar(
      //   title: Text('Bottom Navigation Bar Example'),
      // ),
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
            fontWeight: FontWeight.w500,
            fontSize: 12),
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
              child: SvgPicture.asset(
                "assets/svg/home.svg",
                height: 18,
                width: 18,
                color: _currentIndex == 0
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/brower.svg",
                height: 17,
                width: 17,
                color: _currentIndex == 1
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            label: 'Brower',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/wishlist.svg",
                height: 20,
                width: 20,
                color: _currentIndex == 2
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            label: 'Wishlist'.tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/cart.svg",
                height: 22,
                width: 22,
                color: _currentIndex == 3
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/profile.svg",
                height: 20,
                width: 20,
                color: _currentIndex == 4
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    // You can return different widgets/screens based on the index
    switch (index) {
      case 0:
        return Home_Screen();
      case 1:
        return SearchScreen();
      case 2:
        return FavoritesScreen();
      case 3:
        return CartScreen();
      case 4:
        return ProfileScreen();
      default:
        return Home_Screen();
    }
  }
}
