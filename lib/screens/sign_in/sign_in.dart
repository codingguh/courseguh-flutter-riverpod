import 'dart:async';

import 'package:courseguh/common/global_loader/global_loader.dart';
import 'package:courseguh/common/global_success/global_success.dart';
import 'package:courseguh/common/widgets/app_bar.dart';
import 'package:courseguh/common/widgets/app_textfields.dart';
import 'package:courseguh/common/widgets/button_widget.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:courseguh/screens/sign_in/notifier/sign_in_notifier.dart';
import 'package:courseguh/screens/sign_in/sign_in_controller.dart';
import 'package:courseguh/screens/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late SignInController _controller;
  // void handleRegister() {}

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    _controller = SignInController(ref);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInprovider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    final isSuccessRegister = ref.watch(appRegisterSuccessProvider);
    print("=======is success $isSuccessRegister ============");

    return Scaffold(
      body: Stack(
        children: [
          // Main content widgets
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                appBar: buildAppBar(context, title: "Login"),
                backgroundColor: Colors.white,
                body: loader == false
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //top login button
                            thirdPartyLogin(),
                            //more login option message
                            Center(
                              child: text14Normal(
                                text: "Or use your email account to login",
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            //email text box
                            appTextField(
                              text: "Email",
                              controller: emailController,
                              iconName: "assets/icons/user.png",
                              hintText: "Enter your email address",
                              func: (value) => ref
                                  .read(signInNotifierProvider.notifier)
                                  .onUserEmailChange(value),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            //password text box
                            appTextField(
                              text: "Password",
                              controller: passwordController,
                              iconName: "assets/icons/lock.png",
                              hintText: "Enter your password",
                              obsecureText: true,
                              func: (value) => ref
                                  .read(signInNotifierProvider.notifier)
                                  .onPasswordChange(value),
                            ),
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
                            Center(
                              child: appButton(
                                buttonName: 'Login',
                                func: () => _controller.handleSignIn(context),
                              ),
                            ),
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
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: LottieBuilder.asset(
                            'assets/animation/loading.json',
                            height: 300.h,
                            reverse: true,
                            repeat: true,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          // Overlay Lottie animation
          isSuccessRegister
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      'assets/animation/success.json',
                      height: 200, // Adjust height as needed
                      width: 200, // Adjust width as needed
                      reverse: true,
                      repeat: true,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
