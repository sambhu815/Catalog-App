import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      accentColor: Colors.deepPurple,
      buttonColor: darkBluishColor,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
        brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.black,
          canvasColor: creamDarkColor,
          buttonColor: lightBluishColor,
          accentColor: Colors.white,
          appBarTheme: const AppBarTheme(
              color: Colors.black,
              iconTheme: IconThemeData(color: Colors.white),

              titleTextStyle: TextStyle(color: Colors.white))
      );

  //colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color creamDarkColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;

}
