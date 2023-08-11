import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
//   Color? canvasColor,
//   Color? cardColor,
//   ColorScheme? colorScheme,
//   Color? colorSchemeSeed,
//   Color? dialogBackgroundColor,
//   Color? disabledColor,
//   Color? dividerColor,
//   Color? focusColor,
//   Color? highlightColor,
//   Color? hintColor,
//   Color? hoverColor,
//   Color? indicatorColor,
//   Color? primaryColor,
//   Color? primaryColorDark,
//   Color? primaryColorLight,
//   MaterialColor? primarySwatch,
//   Color? scaffoldBackgroundColor,
//   Color? secondaryHeaderColor,
//   Color? shadowColor,
//   Color? splashColor,
//   Color? unselectedWidgetColor,
//   Color? toggleableActiveColor,
//   Color? selectedRowColor,
//   Color? errorColor,
//   Color? backgroundColor,
//   Color? bottomAppBarColor,
// })

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('#FEFEFE'), //---background color

    // fontFamily: 'plusjakarta',
    cardColor: Color.fromRGBO(255, 255, 255, 1), //card container color
    indicatorColor: Colors.orange, //----selection color
    hintColor: Colors.black, //--text color
    secondaryHeaderColor: HexColor('#FFFFFF'), //--pure white
    shadowColor: HexColor('#F3F6FB'), //icon color
    disabledColor: HexColor('#989E9F'), //disable light text color
    dividerColor: HexColor('#2D3C52'), //icon border color
    highlightColor: HexColor('#F3F6FB'), //image background color
    hoverColor: HexColor('#2D3C52'), //--botton color
    focusColor: HexColor('#1B5EC9'),
  );

  // static TextStyle getgooglefont() {
  //   return GoogleFonts.plusJakartaSans();
  // }

  // static ThemeData darkTheme = ThemeData(
  //     primaryColor: const Color(0xffadc148),
  //     scaffoldBackgroundColor: backgroundColorDark,
  //     secondaryHeaderColor: textColorDark,
  //     cardColor: HexColor("#252525"),
  //     focusColor: Vx.gray100,
  //     highlightColor: const Color.fromARGB(255, 24, 24, 24),
  //     hoverColor: Vx.gray100);

  static BoxDecoration getBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Theme.of(context).disabledColor.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(1.0, 1.0))

        // BoxShadow(
        //   color: Colors.white70.withOpacity(0.1),
        //   blurRadius: 10,
        //   offset: const Offset(1.0, 1.0), // soften the shadow
        //   spreadRadius: 0.0, //extend the shadow
        // ),
      ],
      border: Border.all(color: Colors.black.withOpacity(0.05)),
    );
  }
}
