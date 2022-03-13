import 'package:flutter/material.dart';

class CoreTheme {
  static final List<Color> _colors = [
    const Color(0xF8023F67),
    const Color(0xfa01060e),
    const Color(0xf8f3eff3),
    const Color(0xf859015b),
    const Color(0xf8535021),
  ];

  static ThemeData appTheme() => ThemeData(
        primaryColor: _colors[0],
        canvasColor: _colors[2],
        scaffoldBackgroundColor: _colors[0],
        appBarTheme: AppBarTheme(
            color: _colors[0],
            titleTextStyle: TextStyle(
              color: _colors[2],
              fontSize: 25,
              fontFamily: 'Quintessential',
              fontWeight: FontWeight.w700,
            )),
      );
}
