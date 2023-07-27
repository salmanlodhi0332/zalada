import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/all_custom_btn.dart';
import 'package:zalada_app/custom/search_screen_widgets/search_grid.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';
// import '../custom/search_screen_widgets/categories_btn.dart';

class Wishlist_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "your_wishlist".tr,
                style: TextStyle(
                    fontFamily: 'plusjakarta',
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ).py(15).px(25),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    all_custom_btn(),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                        size: 15,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                        size: 15,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                        size: 15,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                        size: 15,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                        size: 15,
                      ),
                    ),
                  ],
                ).px(20),
              ).py(20),
              search_grid(),
            ],
          ),
        ),
      ),
    );
  }
}
