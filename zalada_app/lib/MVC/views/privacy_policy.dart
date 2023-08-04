import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/back_button.dart';

import '../controller/privacy_controller.dart';

class privacy_policy extends StatefulWidget {
  const privacy_policy({super.key});

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final Privacy_Controller controller = Get.put(Privacy_Controller());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Privacy Policy".tr,
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontFamily: 'plusjakarta',
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
          controller.getAllPrivacy();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.privacylist
                    .map((e) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListTile(
                          title: Text(e.title),
                          subtitle: Text(e.content),
                        )))
                    .toList(),
              )),
        ),
      ),
    );
  }
}
