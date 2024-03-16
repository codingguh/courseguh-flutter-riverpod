import 'package:courseguh/common/widgets/app_shadow.dart';
import 'package:courseguh/common/widgets/image_widgets.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appTextField(
    {String text = "",
    String iconName = "",
    String hintText = "Type in your info",
    bool obsecureText = false,
    TextEditingController? controller,
    void Function(String value)? func}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxShadowTextField(),
          child: Row(
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              appTextFieldOnly(
                  controller: controller,
                  hintText: hintText,
                  func: func,
                  obsecureText: obsecureText)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 280,
  double height = 50,
  void Function(String value)? func,
  bool obsecureText = false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) => {func!(value)},
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.h, left: 10.w),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          //default border without any input
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))),

      maxLines: 1,
      autocorrect: false,
      obscureText: obsecureText,
      //focus border is with your input
    ),
  );
}
