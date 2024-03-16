import "package:courseguh/common/utils/app_colors.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    fontweight = FontWeight.normal}) {
  AppColors colors = AppColors();
  colors.x = 10;
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24.sp, fontWeight: fontweight),
  );
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text16Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16.sp, fontWeight: fontWeight),
    );
  }
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style:
        TextStyle(color: color, fontSize: 14.sp, fontWeight: FontWeight.normal),
  );
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text14Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryThreeElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 14.sp, fontWeight: fontWeight),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text10Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryThreeElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 11.sp, fontWeight: fontWeight),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text11Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 11.sp, fontWeight: fontWeight),
    );
  }
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
