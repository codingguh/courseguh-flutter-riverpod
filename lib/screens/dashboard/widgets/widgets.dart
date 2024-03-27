import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/utils/image_res.dart';
import 'package:courseguh/common/widgets/image_widgets.dart';
import 'package:courseguh/screens/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement, imagePath: "assets/icons/home.png"),
      backgroundColor: AppColors.primaryBackground,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.search),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement, imagePath: ImageRes.search),
      backgroundColor: AppColors.primaryBackground,
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.play),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement, imagePath: ImageRes.play),
      backgroundColor: AppColors.primaryBackground,
      label: "Play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.message),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement, imagePath: ImageRes.message),
      backgroundColor: AppColors.primaryBackground,
      label: "Message"),
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.profile),
      activeIcon: _bottomContainer(
          color: AppColors.primaryElement, imagePath: ImageRes.profile),
      backgroundColor: AppColors.primaryBackground,
      label: "Profile"),
];

Widget _bottomContainer(
    {double width = 15,
    double height = 15,
    String imagePath = ImageRes.home,
    Color color = AppColors.primaryFourElementText}) {
  return Container(
    width: 15.w,
    height: 15.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    const Home(),
    const Center(
      child: AppImage(imagePath: ImageRes.search, width: 250, height: 250),
    ),
    const Center(
      child: AppImage(imagePath: ImageRes.play, width: 250, height: 250),
    ),
    const Center(
      child: AppImage(imagePath: ImageRes.message, width: 250, height: 250),
    ),
    const Center(
      child: AppImage(imagePath: ImageRes.profile, width: 250, height: 250),
    ),
  ];

  return screens[index];
}
