import 'package:courseguh/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final int x = 0;
  static ThemeData appThemeData = ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.primaryText)));
}
