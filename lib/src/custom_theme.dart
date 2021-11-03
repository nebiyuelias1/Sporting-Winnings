import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF076DA7);
  static const Color indicatorColor = Color(0xFF0988D1);
  static const Color unselectedLabelColor = Color(0xFFC4C4C4);
  static const Color bodyBackgroundColor = Color(0xFFF1F1F1);
  static const Color sportsTabBarLabelColor = Color(0xFF476678);
}

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColor.primaryColor,
    ),
  );
}
