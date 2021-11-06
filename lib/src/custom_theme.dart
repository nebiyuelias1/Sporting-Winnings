import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF076DA7);
  static const Color indicatorColor = Color(0xFF0988D1);
  static const Color unselectedLabelColor = Color(0xFFC4C4C4);
  static const Color bodyBackgroundColor = Color(0xFFF1F1F1);
  static const Color sportsTabBarLabelColor = Color(0xFF476678);
  static const Color dateTimeColor = Color(0xFFB6B6B6);
  static const Color teamsColor = Color(0xFF7598AC);
  static const Color betOptionBackgroundColor = Color(0xFFF2F4F5);
  static const Color betOptionBorderColor = Color(0xFF076DA7);
  static const Color betOptionTextColor = Color(0xFF7598AC);
  static const Color betOptionHeaderTextColor = Color(0xFFD0D0D0);
  static const Color removeButtonBackgroundColor = Color(0xFFEF5555);
}

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: CustomColor.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColor.primaryColor,
    ),
  );
}
