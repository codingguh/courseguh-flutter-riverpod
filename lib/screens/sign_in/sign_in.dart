import 'package:courseguh/common/widgets/app_bar.dart';
import 'package:courseguh/common/widgets/app_textfields.dart';
import 'package:courseguh/common/widgets/button_widget.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:courseguh/screens/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  void handleRegister() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(context, title: "Login"),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //top login button
                    thirdPartyLogin(),
                    //more login option message
                    Center(
                        child: text14Normal(
                            text: "Or use your email account to login")),
                    SizedBox(
                      height: 50.h,
                    ),

                    //email text box
                    appTextField(
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address"),
                    SizedBox(
                      height: 20.h,
                    ),
                    //password text box
                    appTextField(
                        text: "Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your password",
                        obsecureText: true),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: textUnderLine(text: "Forgot Password"),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),

                    //app login button
                    Center(child: appButton(buttonName: 'Login')),
                    //app register button
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: appButton(
                            buttonName: 'Register',
                            isLogin: false,
                            context: context,
                            func: () {
                              Navigator.pushNamed(context, "/sign-up");
                            })),
                  ],
                ),
              ))),
    );
  }
}
