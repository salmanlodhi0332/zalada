import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/views/bottom_bar.dart';
import 'package:zalada_app/service/fcm_token.dart';
import 'package:zalada_app/utiles/multi_language.dart';
import 'package:zalada_app/utiles/themeData.dart';
import 'MVC/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// @override
// Widget build(BuildContext context) {
//   return PlatformApp(
//     debugShowCheckedModeBanner: false,
//     material: (_, __)=>,
//     cupertino: (_, __)=?,
//     home: Main_Page(),

//   );
// }}
// class Main_Page extends StatefulWidget {
//   const Main_Page({super.key});

//   @override
//   State<Main_Page> createState() => _Main_PageState();
// }

// class _Main_PageState extends State<Main_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

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
