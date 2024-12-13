import 'package:flutter/material.dart';

class ThemesApp{
  static final light=ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.yellow),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 50,
        color: Colors.red
      ),
      titleLarge: TextStyle(
        fontSize: 30
      )
    )
  );

  static final dark=ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.yellow),
      scaffoldBackgroundColor: Colors.black12,
      textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 50,
          ),
          titleLarge: TextStyle(
              fontSize: 30
          )
      )
  );
}