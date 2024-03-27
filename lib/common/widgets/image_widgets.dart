import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/utils/image_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const AppImage(
      {super.key,
      this.imagePath = ImageRes.defaultImg,
      this.width = 16,
      this.height = 16});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
      width: width.w,
      height: height.h,
    );
  }
}

Widget appImageWithColor(
    {String imagePath = ImageRes.defaultImg,
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryElement}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
    width: width.w,
    height: height.h,
    color: color,
  );
}
