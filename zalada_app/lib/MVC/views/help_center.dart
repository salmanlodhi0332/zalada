import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/help_center_controller.dart';
import 'package:zalada_app/custom/back_button.dart';

import '../controller/privacy_controller.dart';

class help_center extends StatefulWidget {
  const help_center({super.key});

  @override
  State<help_center> createState() => _help_centerState();
}

class _help_centerState extends State<help_center> {
  final help_center_controller controller = Get.put(help_center_controller());

  @override
  void initState() {
    super.initState();
    controller.getAllhelpcenterdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Help_Center".tr,
          style: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
        leading: back_button(
          ontap: () {
            Get.back();
          },
        ).p(10),
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getAllhelpcenterdata();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.helpcenterlist
                      .map((e) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListTile(
                            title: Text(e.title),
                            subtitle: Text(e.content),
                          )))
                      .toList(),
                ),
              )),
        ),
      ),
    );
  }
}
