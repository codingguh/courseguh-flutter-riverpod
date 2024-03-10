import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/widgets/app_bar.dart';
import 'package:courseguh/common/widgets/app_textfields.dart';
import 'package:courseguh/common/widgets/button_widget.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:courseguh/screens/sign_up/notifier/register_notifier.dart';
import 'package:courseguh/screens/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import './sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Here you can access the BuildContext
      _controller = SignUpController(ref: ref, buildContext: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    //regProvider.
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  //more login options message
                  Center(
                      child: text14Normal(
                          text: "Enter your details below & free sign up")),
                  SizedBox(
                    height: 50.h,
                  ),
                  //user name text box
                  appTextField(
                    text: "User name",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your user name",
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onUserNameChange(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //email text box
                  appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address",
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onUserEmailChange(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //password text box
                  appTextField(
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obsecureText: true,
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onPasswordChange(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //password text box
                  appTextField(
                      text: "Confirm your password",
                      iconName: "assets/icons/lock.png",
                      hintText: "Confirm your password",
                      func: (value) => ref
                          .read(registerNotifierProvider.notifier)
                          .onConfirmPasswordChange(value),
                      obsecureText: true),
                  SizedBox(
                    height: 20.h,
                  ),
                  //forgot text
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: text14Normal(
                          text:
                              "By creating an account you are agreeing with our terms and conditions")),
                  SizedBox(
                    height: 100.h,
                  ),

                  Center(
                      child: appButton(
                          buttonName: "Register",
                          isLogin: true,
                          context: context,
                          func: () => _controller.handleSignUp()
                          // func: () {})
                          ))
                  //app register button
                ],
              ),
            )),
      ),
    );
  }
}
