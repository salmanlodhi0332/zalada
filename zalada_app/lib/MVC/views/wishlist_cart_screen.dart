import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/all_custom_btn.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:zalada_app/custom/search_screen_widgets/search_grid.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';

class Wishlist_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Custom_Appbar(
          title: "your_wishlist".tr,
          leadingButton: back_button(ontap: () {
            Get.back();
          })),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            search_grid(),
          ],
        ),
      ),
    );
  }
}
