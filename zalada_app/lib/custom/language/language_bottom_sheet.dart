import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/language/language_data.dart';
import '../botton_widget.dart';

class language_bottom_sheet extends GetView {
  RxInt selectedValueforlang = 1.obs;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      // height: height - 200,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).disabledColor,
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 13,
                horizontal: (Get.width / 2) - 60,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            Text(
              'select_language'.tr,
              style: TextStyle(
                fontFamily: 'plusjakarta',
                color: Theme.of(context).hintColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ).py(10),
            Wrap(
              children: Language_data.langauges
                  .map((e) => Obx(
                        () => GestureDetector(
                          onTap: () {
                            selectedValueforlang.value = e.id;
                            print(selectedValueforlang.value);
                            Get.updateLocale(Locale(e.lancode, e.countrycode));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedValueforlang.value == e.id
                                        ? Theme.of(context)
                                            .indicatorColor
                                            .withOpacity(0.5)
                                        : Theme.of(context)
                                            .hintColor
                                            .withOpacity(0.5),
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Theme.of(context).highlightColor,
                                child: Image.asset(
                                  e.prefixIcon,
                                  height: 30,
                                  width: 30,
                                ),
                              ).pOnly(top: 10, bottom: 10),
                              title: Text(
                                e.label,
                                style: TextStyle(
                                  fontFamily: 'plusjakarta',
                                  color: Theme.of(context).hintColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: selectedValueforlang.value == e.id
                                  ? CircleAvatar(
                                      radius: 12,
                                      backgroundColor:
                                          Theme.of(context).indicatorColor,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ).p(10)
                                  : CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Color.fromARGB(0, 130, 127, 127),
                                    ).p(10),
                            ),
                          ),
                        ).py(5),
                      ))
                  .toList(),
            ),
            // Obx(
            //   () => GestureDetector(
            //     onTap: () {
            //       selectedValueforlang.value = 1;

            //       // getxcontroller.updateSelectedValueForlang(
            //       //     getxcontroller.selectedValueforlang.value);
            //       Get.updateLocale(const Locale('id', 'ID'));
            //       selectedlanguage_0.value = 1;

            //       print(selectedValueforlang.value);
            //     },
            //     child: select_language(
            //       preffixIcon: Image.asset(
            //         'assets/icon/Indonesia.png',
            //         height: 30,
            //         width: 30,
            //       ),
            //       label: 'indonesia'.tr,
            //       selected: selectedlanguage_0
            //           .value, // Access the bool value using .value
            //     ),
            //   ),
            // ).py(10),
            // Obx(
            //   () => GestureDetector(
            //     onTap: () {
            //       selectedValueforlang.value = 3;

            //       // getxcontroller.updateSelectedValueForlang(
            //       //     getxcontroller.selectedValueforlang.value);
            //       Get.updateLocale(const Locale('en', 'US'));
            //       selectedlanguage_1.value = 2;
            //       selectedlanguage_0.value = 0;
            //       selectedlanguage_2.value = 0;
            //       selectedlanguage_3.value = 0;
            //       print(selectedValueforlang.value);
            //     },
            //     child: select_language(
            //       preffixIcon: Image.asset(
            //         'assets/icon/English(US).png',
            //         height: 30,
            //         width: 30,
            //       ),
            //       label: 'English(US)'.tr,
            //       selected: selectedlanguage_1
            //           .value, // Access the bool value using .value
            //     ),
            //   ),
            // ).py(10),
            // Obx(
            //   () => GestureDetector(
            //     onTap: () {
            //       selectedValueforlang.value = 3;

            //       // getxcontroller.updateSelectedValueForlang(
            //       //     getxcontroller.selectedValueforlang.value);
            //       Get.updateLocale(const Locale('th', 'TH'));
            //       selectedlanguage_2.value = 3;
            //       selectedlanguage_0.value = 0;
            //       selectedlanguage_1.value = 0;
            //       selectedlanguage_3.value = 0;
            //       print(selectedValueforlang.value);
            //     },
            //     child: select_language(
            //       preffixIcon: Image.asset(
            //         'assets/icon/Thailand.png',
            //         height: 30,
            //         width: 30,
            //       ),
            //       label: 'thailand'.tr,
            //       selected: selectedlanguage_2
            //           .value, // Access the bool value using .value
            //     ),
            //   ),
            // ).py(10),
            // Obx(
            //   () => GestureDetector(
            //     onTap: () {
            //       selectedValueforlang.value = 4;

            //       // getxcontroller.updateSelectedValueForlang(
            //       //     getxcontroller.selectedValueforlang.value);
            //       Get.updateLocale(const Locale('zh', 'CN'));
            //       selectedlanguage_0.value = 0;
            //       selectedlanguage_1.value = 0;
            //       selectedlanguage_2.value = 0;
            //       selectedlanguage_3.value = 4;
            //       print(selectedValueforlang.value);
            //     },
            //     child: select_language(
            //       preffixIcon: Image.asset(
            //         'assets/icon/Chinese.png',
            //         height: 30,
            //         width: 30,
            //       ),
            //       label: 'chinese'.tr,
            //       selected: selectedlanguage_3
            //           .value, // Access the bool value using .value
            //     ),
            //   ),
            // ).py(10),
            Button_Widget(
              width: width,
              title: 'continue'.tr,
              ontap: () {
                // Page_Navigation().Screen(context, OTP_Screen());
              },
            ).pOnly(bottom: 30),
          ],
        ),
      ),
    ).p(15);
  }
}
