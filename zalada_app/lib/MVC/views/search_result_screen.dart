import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/botton_widget.dart';

import '../../custom/filter_bar.dart';
import '../../custom/search_screen_widgets/search_bar_textFeild.dart';
import '../../custom/search_screen_widgets/search_grid.dart';

class search_result_screen extends StatefulWidget {
  const search_result_screen({super.key});

  @override
  State<search_result_screen> createState() => _search_result_screenState();
}

class _search_result_screenState extends State<search_result_screen> {
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                back_button(
                  ontap: () {
                    Get.back();
                  },
                ),
                // SizedBox(
                //   width: 10,
                // ),
                search_bar_textfeild(
                  controller: search,
                  hintText: 'Search Product..',
                )
              ],
            ),
            search_grid()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button_Widget(
        title: 'Filter',
        icon: Icon(
          Icons.filter_alt,
          color: Theme.of(context).cardColor,
        ),
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? size.width / 3
            : size.width / 5,
        ontap: () {
          Get.bottomSheet(
            Filter_Bottom_Bar(),
            isScrollControlled: true,
          );
        },
      ),
    );
  }
}
