import 'package:flutter/material.dart';

class ThemeHelper {
  static Color primaryColor = const Color.fromARGB(255, 250, 110, 35);
  static Color secondry = const Color.fromARGB(255, 0, 0, 0);

  static Color accentColor = Colors.white;
  static Color shadowColor = const Color.fromARGB(22, 0, 0, 0);

  static ThemeData getThemeData() {
    return ThemeData(
      // fontFamily: 'Langar-Regular',
      // primarySwatch: Colors.deepPurple,
      // colorScheme: ColorScheme.light(
      //     primary: Color.fromARGB(255, 231, 112, 112), secondary: Colors.black),
      textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: accentColor,
          ),
          headline2: TextStyle(
            fontSize: 22,
            color: accentColor,
          ),
          headline3: TextStyle(
            fontSize: 15,
            color: accentColor,
          )),
    );
  }
}
