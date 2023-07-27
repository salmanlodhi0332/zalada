import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/views/address.dart';
import 'package:zalada_app/MVC/views/payment_method.dart';
import 'package:zalada_app/MVC/views/privacy_policy.dart';
import 'package:zalada_app/MVC/views/product_detail.dart';
import 'package:zalada_app/utiles/multi_language.dart';
import 'package:zalada_app/utiles/themeData.dart';
// import 'package:zalada_app/views/bottom_bar.dart';
// import 'package:zalada_app/views/otp_screen.dart';
// import 'package:zalada_app/views/splash_screen.dart';

import 'MVC/views/edit_profile.dart';
import 'MVC/views/profile_screen.dart';
import 'MVC/views/select_address.dart';
import 'MVC/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            translations: Multi_Language(),
            locale: Locale('en', 'US'),
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: splash_screen(),
          );
        });
  }
}
