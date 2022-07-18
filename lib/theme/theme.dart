import 'package:flutter/material.dart';

import '../helper/constans.dart';

ThemeData getThemeData() {
  return ThemeData(
      colorScheme: const ColorScheme(
          onBackground: Colors.transparent,
          onError: Colors.red,
          error: Colors.red,
          brightness: Brightness.light,
          background: Colors.transparent,
          onPrimary: Color(0x000000ff),
          onSecondary: Color(0x000000ff),
          onSurface: Color(0x000000ff),
          primary: primaryColor,
          secondary: Color(0x000000ff),
          surface: Color(0x000000ff)),
      inputDecorationTheme:const InputDecorationTheme(
          // enabledBorder:  UnderlineInputBorder(
          //     borderSide: BorderSide(color: primaryColor)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          )),

  );
}
