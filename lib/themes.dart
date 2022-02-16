import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: ColorScheme.dark(),
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.deepPurpleAccent,
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.black,
  );
}
