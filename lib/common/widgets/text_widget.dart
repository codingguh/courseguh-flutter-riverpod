import "package:courseguh/common/utils/app_colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Widget text24Normal({String text = "", Color color = AppColors.primaryText}) {
  AppColors colors = AppColors();
  colors.x = 10;
  return Text(
    text,
    textAlign: TextAlign.center,
    style:
        TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.normal),
  );
}

Widget text16Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:
        TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.normal),
  );
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style:
        TextStyle(color: color, fontSize: 14.sp, fontWeight: FontWeight.normal),
  );
}

Widget textUnderLine({String text = "Your Text"}) {
  return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            fontWeight: FontWeight.normal),
      ));
}
