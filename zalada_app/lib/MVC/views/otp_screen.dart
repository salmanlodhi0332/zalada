import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/getxcontroller.dart';
import '../../custom/back_button.dart';
import '../../custom/botton_widget.dart';
import '../controller/authentication_controller.dart';

class OTP_Screen extends StatefulWidget {
  final String verfiyId;
  final String name;
  final String email;
  final String phone;
  final String password;

  OTP_Screen(
      {super.key,
      required this.verfiyId,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  final controller = Get.put(getx_GetController());

  @override
  void initState() {
    super.initState();
    controller.startTimer();
  }

  AuthenticationController authcontroller = Get.put(AuthenticationController());

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'otp'.tr,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
          leading: back_button(
            icon_widget: Icon(Icons.arrow_back),
            ontap: () {
              Get.back();
            },
          )),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/images/OTP.png'),
          ).pOnly(bottom: 10),
          Text(
            'verfication_code'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor,
                fontSize: 24.sp),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: 'otp_description'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).disabledColor,
                  fontSize: 15.sp),
            ),
            TextSpan(
              text: '  +62812 788 6XXXX',
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w700),
            )
          ])).px(50).py(20),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otp_box(context, controller1),
                otp_box(context, controller2),
                otp_box(context, controller3),
                otp_box(context, controller4),
                otp_box(context, controller5),
                otp_box(context, controller6)
              ],
            ),
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.countdown == 0
                      ? TextButton(
                          onPressed: () {}, child: Text('resend_code'.tr))
                      : Text(
                          'recent_code'.tr,
                          style: TextStyle(
                              color: Theme.of(context).hintColor, fontSize: 16.sp),
                        ),
                  Text(
                      controller.countdown == 0
                          ? ''
                          : controller.countdown.toString() + 's',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 16.sp)),
                ],
              )).py(20),
          Button_Widget(
            width: width,
            title: 'continue'.tr,
            ontap: () {
              authcontroller.otp_verification(
                  controller1.text +
                      controller2.text +
                      controller3.text +
                      controller4.text +
                      controller5.text +
                      controller6.text,
                  widget.verfiyId,
                  widget.name,
                  widget.email,
                  widget.phone,
                  widget.password,
                  context);
            },
          )
        ],
      ).px(50),
    );
  }

  Container otp_box(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).disabledColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10)),
      height: 30,
      width: 30,
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
