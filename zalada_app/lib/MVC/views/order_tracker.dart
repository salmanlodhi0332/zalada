
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../custom/back_button.dart';
import 'order_items.dart';

class OrderTracker extends StatefulWidget {
  const OrderTracker({super.key});

  @override
  State<OrderTracker> createState() => _OrderTrackerState();
}

class _OrderTrackerState extends State<OrderTracker> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'trackorder'.tr,
            style: TextStyle(
                color: Theme.of(context).hintColor, fontFamily: 'plusjakarta'),
          ),
          centerTitle: true,
          leading: back_button(
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Wrap(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "invoice".tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          color: Theme.of(context).disabledColor),
                    ),
                    Text(
                      "INV/37662/7899",
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          color: Theme.of(context).hintColor),
                    ),
                  ],
                ).pOnly(top: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "receipt_num".tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          color: Theme.of(context).disabledColor),
                    ),
                    Text(
                      "37893278761",
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          color: Theme.of(context).hintColor),
                    ),
                  ],
                ).pOnly(top: 10),
              ],
            ).pOnly(left: 20, right: 20),
            SizedBox(
              height: 100,
            ),
            Divider(
              color: Theme.of(context).disabledColor.withOpacity(0.4),
              thickness: 4,
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                Center(child: Image.asset("assets/images/Deliverystatus.png")),
                Column(
                  children: [
                    Container(
                        child: Column(children: [
                      Text(
                        "package_delivery".tr,
                        style: TextStyle(
                            fontFamily: 'plusjakarta',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ).p(15).px(20),
                      Wrap(children: [
                        Column(
                          children: [
                            OrderItems(),
                          ],
                        ),
                        Divider(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.4),
                          thickness: 4,
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ]),
                    ])),
                  ],
                )

                // EasyStepper(
                //   defaultLineColor: Theme.of(context).disabledColor,
                //   activeStep: activeStep,
                //   lineLength: 30,
                //   stepShape: StepShape.circle,
                //   stepBorderRadius: 10,
                //   //borderThickness: 2,
                //   //padding: 20,
                //   activeStepBackgroundColor: Colors.amber, stepRadius: 28,
                //   finishedStepBorderColor: Colors.deepOrange,
                //   finishedStepTextColor: Colors.deepOrange,
                //   finishedStepBackgroundColor: Colors.deepOrange,
                //   activeStepIconColor: Colors.deepOrange,
                //   showLoadingAnimation: false,
                //   steps: [
                //     EasyStep(
                //       customStep: Opacity(
                //           opacity: activeStep >= 0 ? 1 : 0.3,
                //           child: Icon(Icons.check_circle)),
                //       // customTitle: const Text(
                //       //   'Dash 1',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 1 ? 1 : 0.3,
                //             child: Icon(Icons.check_circle)),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 2',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 2 ? 1 : 0.3,
                //             child: Icon(Icons.check_circle)),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 3',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 3 ? 1 : 0.3,
                //             child: Icon(Icons.check_circle)),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 4',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     // EasyStep(
                //     //   customStep: ClipRRect(
                //     //     borderRadius: BorderRadius.circular(15),
                //     //     child: Opacity(
                //     //         opacity: activeStep >= 4 ? 1 : 0.3,
                //     //         child: Icon(Icons.check_circle)),
                //     //   ),
                //     //   // customTitle: const Text(
                //     //   //   'Dash 5',
                //     //   //   textAlign: TextAlign.center,
                //     //   // ),
                //     // ),
                //   ],
                //   onStepReached: (index) => setState(() => activeStep = index),
                // ),
              ],
            ),
            Column(
              children: [
                Text(
                  "order_status".tr,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ).px(20).pOnly(right: 220),

                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ).p(10),
                  title: Text(
                    "Thu, 03 November2022",
                    style: TextStyle(
                        fontFamily: 'plusjakarta', fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text("Your package is in transit"),
                ).px(10),
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ).p(10),
                  title: Text(
                    "Thu, 03 November2022",
                    style: TextStyle(
                        fontFamily: 'plusjakarta', fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text("Your package is in transit"),
                ).px(10),

                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ).p(10),
                  title: Text(
                    "Thu, 03 November2022",
                    style: TextStyle(
                        fontFamily: 'plusjakarta', fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text("Your package is in transit"),
                ).px(10),

                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ).p(10),
                  title: Text(
                    "Thu, 03 November2022",
                    style: TextStyle(
                        fontFamily: 'plusjakarta', fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text("Your package is in transit"),
                ).px(10),

                //  EasyStepper(
                //   defaultLineColor: Theme.of(context).disabledColor,
                //   activeStep: activeStep,
                //   lineLength: 40,
                //   stepShape: StepShape.circle,
                //   stepBorderRadius: 10,
                //   activeStepBackgroundColor: Theme.of(context).cardColor,
                //   stepRadius: 20,
                //   finishedStepBorderColor: Colors.deepOrange,
                //   finishedStepTextColor: Colors.deepOrange,
                //   finishedStepBackgroundColor: Colors.deepOrange,
                //   activeStepIconColor: Colors.deepOrange,
                //   showLoadingAnimation: false,
                //   direction: Axis.vertical,
                //   steps: [
                //     EasyStep(
                //       customStep: Opacity(
                //           opacity: activeStep >= 0 ? 1 : 0.3,
                //           child: Icon(
                //             Icons.check_circle,
                //             color: Colors.green,
                //           )),
                //       // customTitle: const Text(
                //       //   'Dash 1',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 1 ? 1 : 0.3,
                //             child: Icon(
                //               Icons.check_circle,
                //               color: Colors.green,
                //             )),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 2',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 2 ? 1 : 0.3,
                //             child: Icon(
                //               Icons.check_circle,
                //               color: Colors.green,
                //             )),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 3',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 3 ? 1 : 0.3,
                //             child: Icon(
                //               Icons.check_circle,
                //               color: Colors.green,
                //             )),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 4',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //     EasyStep(
                //       customStep: ClipRRect(
                //         borderRadius: BorderRadius.circular(15),
                //         child: Opacity(
                //             opacity: activeStep >= 4 ? 1 : 0.3,
                //             child: Icon(
                //               Icons.check_circle,
                //               color: Colors.green,
                //             )),
                //       ),
                //       // customTitle: const Text(
                //       //   'Dash 5',
                //       //   textAlign: TextAlign.center,
                //       // ),
                //     ),
                //   ],
                //   onStepReached: (index) => setState(() => activeStep = index),
                // ).pOnly(right: 280),
              ],
            )
          ]),
        ));
  }
}
