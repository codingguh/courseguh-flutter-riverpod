import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/widgets/app_shadow.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final double width;
  final double height;
  final bool isLogin;
  final void Function()? func;
  final BuildContext? context;
  // final BuildContext? context;
  const AppButton(
      {super.key,
      this.buttonName = "",
      this.width = 325,
      this.height = 50,
      this.isLogin = true,
      this.context,
      this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: 325.w,
        height: 50.h,
        decoration: appBoxShadow(
            color: isLogin ? AppColors.primaryElement : Colors.white,
            boxBorder: Border.all(color: AppColors.primaryFourElementText)),
        child: Center(
            child: Text16Normal(
                text: buttonName,
                color: isLogin
                    ? AppColors.primaryBackground
                    : AppColors.primaryText)),
      ),
    );
  }
}
