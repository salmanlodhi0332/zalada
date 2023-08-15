import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/home_controller.dart';

import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/botton_widget.dart';
import 'package:zalada_app/service/Api_Service.dart';

import '../../custom/filter_bar.dart';
import '../../custom/search_screen_widgets/search_bar_textFeild.dart';
import '../../custom/search_screen_widgets/search_grid.dart';
import '../../utiles/shimmer_custom.dart';

class search_result_screen extends StatefulWidget {
  const search_result_screen({super.key});

  @override
  State<search_result_screen> createState() => _search_result_screenState();
}

class _search_result_screenState extends State<search_result_screen> {
  final searchcontroller = TextEditingController();
  final controller = Get.put(home_Controller());

  @override
  void initState() {
    super.initState();
    controller.getrecentsearch();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(searchcontroller.text);
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
                  controller: searchcontroller,
                  hintText: 'Search Product..',
                  onFieldSubmitted: (value) {
                    // Process the submitted value, e.g., navigate or perform an action
                    ApiService.getInstance.Add_recentsearch(value, context);
                    print('Submitted: $value');
                    controller.getrecentsearch();
                    // Reset the focus to remove the keyboard
                    FocusScope.of(context).unfocus();
                  },
                )
              ],
            ),
            Obx(() => controller.recentsearchlist.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'search_history'.tr,
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 18.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              ApiService.getInstance
                                  .delete_recentsearch(context);
                              Timer(Duration(seconds: 1), () {
                                controller.getrecentsearch();
                              });
                            },
                            child: CircleAvatar(
                                radius: 14,
                                backgroundColor:
                                    Theme.of(context).highlightColor,
                                child: SvgPicture.asset(
                                  "assets/svg/delete.svg",
                                  height: 14,
                                  width: 14,
                                )),
                          )
                        ],
                      ).pOnly(bottom: 5),
                      Wrap(
                          children: controller.recentsearchlist
                              .map((e) => Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.16),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    e.search_query!,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp),
                                  )).pOnly(right: 10))
                              .toList())
                    ],
                  ).px(20)
                : SizedBox()),
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
