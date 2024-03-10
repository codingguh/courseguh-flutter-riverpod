import 'package:courseguh/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15.0,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: Offset(0, 1))
      ]);
}
