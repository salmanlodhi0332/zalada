import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/edit_profile.dart';
import 'package:zalada_app/MVC/views/help_center.dart';
import 'package:zalada_app/MVC/views/password_change_screen.dart';
import 'package:zalada_app/MVC/views/payment_method.dart';
import 'package:zalada_app/MVC/views/Address_Screen.dart';
import 'package:zalada_app/MVC/views/wishlist_cart_screen.dart';
import 'package:zalada_app/custom/profile_widget/account_section.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalada_app/utiles/multi_language.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/privacy_policy.dart';

import '../../custom/botton_widget.dart';
import '../../custom/custom_appbar.dart';
import '../../custom/back_button.dart';
import '../../custom/language/language_bottom_sheet.dart';
import '../controller/authentication_controller.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Custom_Appbar(
        title: "Profile".tr,
        actionButtons: [
          back_button(
            ontap: () {
              Get.to(edit_profile());
            },
            icon_widget: SvgPicture.asset(
              "assets/svg/user-edit.svg",
            ).p(10),
          )
        ],
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).disabledColor.withOpacity(0.3),
              child: Image.asset(
                "assets/images/Profile.png",
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Bryan Adam",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "BryanAdam@hotmail.com",
              style: TextStyle(
                  fontFamily: 'plusjakarta',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).hintColor.withOpacity(0.3)),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  // Background color of the container
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "My_Order".tr,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'plusjakarta',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            child: Text(
                              "see_all".tr,
                              style: TextStyle(
                                  fontFamily: 'plusjakarta',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Order ID 231319",
                            style: TextStyle(
                                fontFamily: 'plusjakarta',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).disabledColor),
                          ),
                        ),
                        Container(
                            width: size.width * 0.2,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Theme.of(context).indicatorColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "In_delievery".tr,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'plusjakarta',
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 2,
                        color: Theme.of(context).disabledColor.withOpacity(0.3),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/product.png",
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Ipad pro 2020",
                          style: TextStyle(
                              fontFamily: 'plusjakarta',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  child: Text(
                                    "Track_Order".tr,
                                    style: TextStyle(
                                      fontFamily: 'plusjakarta',
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Account Setting",
                    style: TextStyle(
                        fontFamily: 'plusjakarta',
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Page_Navigation.getInstance.Page(context, Address_Screen());
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Address",
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/pin.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                Page_Navigation.getInstance.Page(context, Wishlist_Screen());
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "my_wishlist".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/wishlist.svg",
                  height: 20,
                  width: 20,
                  color: Theme.of(context).hoverColor,
                ),
              ),
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                Page_Navigation.getInstance.Page(context, payment_method());
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Payment_Method".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/credit.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Notifications".tr,
              showSwitchbtn: true,
              svgicon: SvgPicture.asset(
                "assets/svg/noti.svg",
                height: 17,
                width: 17,
              ),
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                Page_Navigation.getInstance
                    .Page(context, ChangePasswordScreen());
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Account_Security".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/privacy.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "General",
                    style: TextStyle(
                        fontFamily: 'plusjakarta',
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Invite_Friends".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/group.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  language_bottom_sheet(),
                  isScrollControlled: true,
                );
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Language".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/language.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                Page_Navigation.getInstance.Page(context, privacy_policy());
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Privacy_Policy".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/security.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                Page_Navigation.getInstance.Page(context, help_center());
              },
              child: account_section(
                backgroundcolor: Theme.of(context).hintColor,
                title: "Help_Center".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/help.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            custom_divider(context),
            GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Theme.of(context).cardColor,
                      title: Text('want_to_logout'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Theme.of(context).hintColor)),
                      actions: [
                        Button_Widget(
                          height: 35,
                          brodercolor: Colors.black,
                          color: Colors.white,
                          width: double.infinity,
                          title: 'cancel'.tr,
                          ontap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(height: 10),
                        Button_Widget(
                          height: 40,
                          width: double.infinity,
                          title: 'logout'.tr,
                          ontap: () async {
                            final auth = Get.put(AuthenticationController());
                            auth.logout(context);
                          },
                        )
                      ],
                    ),
                  );
                } else {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text(
                        'want_to_logout'.tr,
                        style: TextStyle(color: CupertinoColors.inactiveGray),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('cancel'.tr),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('logout'.tr),
                          onPressed: () async {
                            final auth = Get.put(AuthenticationController());
                            auth.logout(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: account_section(
                backgroundcolor: Colors.red,
                title: "Logout".tr,
                showSwitchbtn: false,
                svgicon: SvgPicture.asset(
                  "assets/svg/logout.svg",
                  height: 17,
                  width: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding custom_divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        thickness: 1,
        color: Theme.of(context).disabledColor.withOpacity(0.3),
      ),
    );
  }
}
