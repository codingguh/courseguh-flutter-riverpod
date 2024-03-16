import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/utils/image_res.dart';
import 'package:courseguh/common/widgets/app_shadow.dart';
import 'package:courseguh/common/widgets/app_textfields.dart';
import 'package:courseguh/common/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchBar() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //search text box
    Container(
      width: 280.w,
      height: 40.h,
      decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            child: appImage(imagePath: ImageRes.searchIcon),
          ),
          SizedBox(
            width: 240.w,
            height: 40.h,
            child: appTextFieldOnly(
                width: 240, height: 40, hintText: "Search Your Course"),
          )
        ],
      ),
    ),
    GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5.w),
        width: 40.w,
        height: 40.h,
        decoration: appBoxShadow(
            boxBorder: Border.all(color: AppColors.primaryElement)),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child:
              appImage(imagePath: ImageRes.searchButton, width: 20, height: 20),
        ),
      ),
    )
  ]);
}
