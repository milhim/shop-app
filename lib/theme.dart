import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

final Map<int, Color> _yellow700Map = {
  50: Color(0xFFFFD7C2),
  100: Colors.yellow[100]!,
  200: Colors.yellow[200]!,
  300: Colors.yellow[300]!,
  400: Colors.yellow[400]!,
  500: Colors.yellow[500]!,
  600: Colors.yellow[600]!,
  700: Colors.yellow[800]!,
  800: Colors.yellow[900]!,
  900: kPrimaryColor,
};

final MaterialColor _primary =
    MaterialColor(Colors.yellow[900]!.value, _yellow700Map);
final theme = ThemeData(
  primaryColor: kPrimaryColor,
  primarySwatch: _primary,
  appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(color: Color(0xff888888), fontSize: 18)),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'open-sens',
  textTheme: TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  ),
);
