import 'package:courseguh/common/widgets/app_shadow.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Widget appOnBoardingScreen(PageController controller,
    {String imagePath = "assets/images/reading.png",
    String title = "",
    String subTitle = "",
    int index = 0}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
          margin: const EdgeInsets.only(top: 15),
          child: text24Normal(text: title)),
      Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: text16Normal(text: subTitle)),
      _nextButton(index, controller)
    ],
  );
}

Widget _nextButton(int index, PageController controller) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(child: text16Normal(text: "Next", color: Colors.white)),
    ),
  );
}
