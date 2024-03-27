import 'package:courseguh/common/models/course_entites.dart';
import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/utils/image_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15.0,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder,
}) {
  return BoxDecoration(
      color: color,
      border: boxBorder,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15.0,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      border: border,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.h), topRight: Radius.circular(20.h)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15.0,
    Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  final double borderRadius;
  final Function()? func;

  const AppBoxDecorationImage({
    Key? key,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 20,
    this.imagePath = ImageRes.profile,
    this.courseItem,
    this.func,
    this.fit = BoxFit.fitHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(fit: fit, image: NetworkImage(imagePath)),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
