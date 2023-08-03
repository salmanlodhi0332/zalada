import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/search_screen_widgets/search_grid.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/search_result_screen.dart';

import '../../custom/all_custom_btn.dart';
import '../../custom/search_bar.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              search_bar_widget(
                onTap: () {
                  Page_Navigation.getInstance
                      .Page(context, search_result_screen());
                },
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // all_custom_btn(),
                    // categories_btn(
                    //   label: 'laptop',
                    //   selected: false,
                    //   preffixIcon: Icon(
                    //     Icons.laptop_windows_outlined,
                    //     color: Theme.of(context).hintColor,
                    //     size: 15,
                    //   ),
                    // ),
                    // categories_btn(
                    //   label: 'laptop',
                    //   selected: false,
                    //   preffixIcon: Icon(
                    //     Icons.laptop_windows_outlined,
                    //     color: Theme.of(context).hintColor,
                    //     size: 15,
                    //   ),
                    // ),
                    // categories_btn(
                    //   label: 'laptop',
                    //   selected: false,
                    //   preffixIcon: Icon(
                    //     Icons.laptop_windows_outlined,
                    //     color: Theme.of(context).hintColor,
                    //     size: 15,
                    //   ),
                    // ),
                    // categories_btn(
                    //   label: 'laptop',
                    //   selected: false,
                    //   preffixIcon: Icon(
                    //     Icons.laptop_windows_outlined,
                    //     color: Theme.of(context).hintColor,
                    //     size: 15,
                    //   ),
                    // ),
                    // categories_btn(
                    //   label: 'laptop',
                    //   selected: false,
                    //   preffixIcon: Icon(
                    //     Icons.laptop_windows_outlined,
                    //     color: Theme.of(context).hintColor,
                    //     size: 15,
                    //   ),
                    // ),
                  ],
                ).px(20),
              ).pOnly(top: 20),
              search_grid(),
            ],
          ),
        ),
      ),
    );
  }
}
