import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/profile_widget/account_section.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/privacy_policy.dart';

import '../../custom/back_button.dart';
import '../../custom/language/language_bottom_sheet.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile".tr,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        // leading: back_button(
        //   ontap: () {},
        // ),
        actions: [
          back_button(
            ontap: () {},
            pic: SvgPicture.asset(
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "BryanAdam@hotmail.com",
              style: TextStyle(
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
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            "see_all".tr,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
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
                                    fontSize: 10, color: Colors.white),
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
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .highlightColor
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Track_Order".tr,
                                  style: TextStyle(
                                    fontSize: 10,
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
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Address",
              showSwitchbtn: false,
              prefixIcon: Icons.pin_drop_outlined,
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Payment_Method".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.credit_card,
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Notifications".tr,
              showSwitchbtn: true,
              prefixIcon: Icons.notifications_active_outlined,
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Account_Security".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.security_rounded,
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
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Invite_Friends".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.group,
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Language".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.language,
              ontap: () {
                 Get.bottomSheet(
                    language_bottom_sheet(),
                    isScrollControlled: true,
                  );
              },
            ),
            custom_divider(context),
            account_section(
              ontap: () {
                Page_Navigation().Page(context, privacy_policy());
              },
              backgroundcolor: Theme.of(context).hintColor,
              title: "Privacy_Policy".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.privacy_tip,
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Theme.of(context).hintColor,
              title: "Help_Center".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.help,
            ),
            SizedBox(
              height: 10,
            ),
            custom_divider(context),
            account_section(
              backgroundcolor: Colors.red,
              title: "Logout".tr,
              showSwitchbtn: false,
              prefixIcon: Icons.logout,
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
