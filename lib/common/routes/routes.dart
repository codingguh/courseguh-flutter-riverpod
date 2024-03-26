import 'package:courseguh/common/routes/app_routes_name.dart';
import 'package:courseguh/global.dart';
import 'package:courseguh/screens/course_detail/view/course_detail.dart';
import 'package:courseguh/screens/dashboard/dashboard.dart';
import 'package:courseguh/screens/home/view/home.dart';
import 'package:courseguh/screens/sign_in/view/sign_in.dart';
import 'package:courseguh/screens/sign_up/view/sign_up.dart';
import 'package:courseguh/screens/welcome/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppScreens {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.SIGN_UP, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.DASHBOARD, page: const Dashboard()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
      RouteEntity(
          path: AppRoutesNames.COURSE_DETAIL, page: const CourseDetail())
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      //print("clicked route is ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        //if we used this is first time or not
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        print(deviceFirstTime);
        print(
            "===Check this ${result.first.path == AppRoutesNames.WELCOME && deviceFirstTime}");
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Dashboard(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => const SignIn(), settings: settings);
          }
        } else {
          if (kDebugMode) {
            print('App run first time');
          }
          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }

      if (settings.name == AppRoutesNames.WELCOME) {
        MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
      } else {
        // Navigator.pushNamed(context, '/sign-in');
      }
    }

    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
