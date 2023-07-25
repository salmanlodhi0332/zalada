import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/search_screen_widgets/search_grid.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/views/search_result_screen.dart';

import '../custom/search_bar.dart';
import '../custom/search_screen_widgets/categories_btn.dart';

class FavoritesScreen extends StatelessWidget {
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
                    Container(
                      // width: size.width/6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).cardColor,
                            child: Icon(
                              Icons.grid_view_rounded,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          Text(
                            'all'.tr,
                            style: TextStyle(
                              fontFamily: 'plusjakarta',
                              color: Theme.of(context).cardColor,
                            ),
                          ).px(10)
                        ],
                      ).p(5),
                    ),
                    categories_btn(
                      label: 'Laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    categories_btn(
                      label: 'Accessories',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    categories_btn(
                      label: 'laptop',
                      selected: false,
                      preffixIcon: Icon(
                        Icons.laptop_windows_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    )
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
