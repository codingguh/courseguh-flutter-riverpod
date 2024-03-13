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
              SizedBox(
                width: 280.w,
                height: 50.h,
                child: TextField(
                  controller: controller,
                  onChanged: (value) => {func!(value)},
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
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
              )
            ],
          ),
        ),
      ],
    ),
  );
}
