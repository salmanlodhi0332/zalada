import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zalada_app/utiles/multi_language.dart';
import 'package:zalada_app/utiles/themeData.dart';
import 'package:zalada_app/views/login_screen.dart';
import 'package:zalada_app/views/registeration_screen.dart';
import 'package:zalada_app/views/splash_screen.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {return
      GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      translations: Multi_Language(),
      locale: Locale('en','US'),
      home: registeration_screen(),
    );
      });     
  }
}