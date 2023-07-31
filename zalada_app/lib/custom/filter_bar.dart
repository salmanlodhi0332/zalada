// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'botton_widget.dart';

class Filter_Bottom_Bar extends GetView {
  // Rx<RangeValues> values = Rx(RangeValues(10, 2499));
  //
  @override
  Widget build(BuildContext context) {
    var values = Rx<RangeValues>(const RangeValues(100, 25000));
    RxBool selected1 = false.obs;
    RxBool selected2 = false.obs;
    RxBool selected3 = false.obs;
    RxBool selected4 = false.obs;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // height: height - 200,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).disabledColor,
              blurRadius: 30,
              offset: const Offset(0, -10)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: 13, horizontal: (Get.width / 2) - 60),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
                //child: SizedBox(height: 1,),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'filter'.tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      color: Theme.of(context).hintColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'reset'.tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
            Divider(color: Theme.of(context).disabledColor),
            Text(
              'price_range'.tr,
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Obx(() => SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 10,
                      rangeThumbShape:
                          RoundRangeSliderThumbShape(enabledThumbRadius: 10),
                      activeTickMarkColor: Theme.of(context).indicatorColor,
                      inactiveTickMarkColor: Theme.of(context).disabledColor),
                  child: RangeSlider(
                    values: values.value,
                    divisions: 100,
                    min: 0,
                    max: 25000,
                    activeColor: Theme.of(context).indicatorColor,
                    inactiveColor:
                        Theme.of(context).disabledColor.withOpacity(0.5),
                    labels: RangeLabels(
                        '${values.value.start}\$', '${values.value.end}\$'),
                    onChanged: (newValues) {
                      // Update the values when the slider changes
                      values.value = newValues;
                    },
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'sort_by'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hintColor,
                      fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => InkWell(
                          onTap: () {
                            selected1.value = !selected1.value;
                          },
                          child: Container(
                              width: width / 2.5,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: selected1.value
                                      ? Theme.of(context).indicatorColor
                                      : Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.5))),
                              child: Text(
                                "new_arrived".tr,
                                style: TextStyle(
                                    fontFamily: 'plusjakarta',
                                    color: selected1.value
                                        ? Theme.of(context).secondaryHeaderColor
                                        : Theme.of(context).hintColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ).centered()),
                        )),
                    Obx(() => InkWell(
                          onTap: () {
                            selected2.value = !selected2.value;
                          },
                          child: Container(
                              width: width / 2.5,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: selected2.value
                                      ? Theme.of(context).indicatorColor
                                      : Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.5))),
                              child: Text(
                                "higher_price".tr,
                                style: TextStyle(
                                    fontFamily: 'plusjakarta',
                                    color: selected2.value
                                        ? Theme.of(context).secondaryHeaderColor
                                        : Theme.of(context).hintColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ).centered()),
                        )),
                  ],
                ).py(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => InkWell(
                          onTap: () {
                            selected3.value = !selected3.value;
                          },
                          child: Container(
                              width: width / 2.5,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: selected3.value
                                      ? Theme.of(context).indicatorColor
                                      : Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.5))),
                              child: Text(
                                "lower_price".tr,
                                style: TextStyle(
                                    fontFamily: 'plusjakarta',
                                    color: selected3.value
                                        ? Theme.of(context).secondaryHeaderColor
                                        : Theme.of(context).hintColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ).centered()),
                        )),
                    Obx(() => InkWell(
                          onTap: () {
                            selected4.value = !selected4.value;
                          },
                          child: Container(
                              width: width / 2.5,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: selected4.value
                                      ? Theme.of(context).indicatorColor
                                      : Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.5))),
                              child: Text(
                                "discount".tr,
                                style: TextStyle(
                                    fontFamily: 'plusjakarta',
                                    color: selected4.value
                                        ? Theme.of(context).secondaryHeaderColor
                                        : Theme.of(context).hintColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ).centered()),
                        )),
                  ],
                )
              ],
            ).py(24),
            Button_Widget(
              width: width,
              title: 'apply_filter'.tr,
              ontap: () {
                // Get.bottomSheet(
                //   Filter_Bottom_Bar(),
                //   isScrollControlled: true,
                // );
                Get.back();
              },
            ).pOnly(bottom: 30),
          ],
        ),
      ),
    );
  }
}
