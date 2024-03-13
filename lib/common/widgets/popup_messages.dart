import 'package:courseguh/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

//positional optional parameter
toastInfo(String msg,
    {Color backgroundColor = AppColors.primaryElement,
    Color textColor = Colors.white,
    required BuildContext context}) {
  return showToast(msg,
      context: context,
      animation: StyledToastAnimation.slideFromRight,
      reverseAnimation: StyledToastAnimation.slideFromRight,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 2000),
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      textAlign: TextAlign.justify,
      shapeBorder: LinearBorder.bottom(),
      textStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),
      backgroundColor: backgroundColor);
}
