import 'dart:async';

import 'package:courseguh/common/global_loader/global_loader.dart';
import 'package:courseguh/common/global_success/global_success.dart';
import 'package:courseguh/common/widgets/popup_messages.dart';
import 'package:courseguh/screens/sign_up/notifier/register_notifier.dart';
import 'package:courseguh/screens/sign_up/sign_up_repo/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController {
  final WidgetRef ref;
  final BuildContext buildContext;

  SignUpController({required this.ref, required this.buildContext});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmpassword;

    print("Your name is $name");
    print("Your email is $email");
    print("Your password is $password");
    print("Your name is $name");

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty", context: buildContext);
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short",
          context: buildContext,
          backgroundColor: const Color.fromARGB(255, 225, 77, 42));
      return;
    }

    if (state.email.isEmpty || state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty", context: buildContext);
      return;
    }

    if (state.password.isEmpty ||
        state.confirmpassword.isEmpty ||
        password.isEmpty) {
      toastInfo("Your password is empty", context: buildContext);
      return;
    }

    if ((state.password != state.confirmpassword) ||
        password != confirmPassword) {
      toastInfo("Your password did not match", context: buildContext);
      return;
    }
    //show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    ref.read(appSuccessProvider.notifier).setSuccessValue(true);

    var context = Navigator.of(ref.context);

    try {
      print("Your name is $name");
      print("Your email is $email");
      print("Your password is $password");
      print("Your name is $name");
      final credential = await SignUpRepo.firebaseSignUp(email, password);
      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        //get server photo url
        //set user photo url
        // Timer(Duration(milliseconds: 900), () {
        ref
            .read(appRegisterSuccessProvider.notifier)
            .setRegisterSuccessValue(true);
        toastInfo("Open your email inbox and verify account",
            context: buildContext);
        // });

        context.pop();
        ref
            .read(appRegisterSuccessProvider.notifier)
            .setRegisterSuccessValue(false);
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        toastInfo("This password is too weak", context: buildContext);
      } else if (ex.code == 'email-already-in-use') {
        toastInfo("this email address has already been registered",
            backgroundColor: const Color.fromARGB(255, 225, 77, 42),
            context: buildContext);
      } else if (ex.code == 'user-not-found') {
        toastInfo("this email address has already been registered",
            backgroundColor: const Color.fromARGB(255, 225, 77, 42),
            context: buildContext);
      }
      print(ex.code);
    }

//show the register app
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}

// class SignUpController {
//   final WidgetRef ref;

//   SignUpController({required this.ref});

//   void handleSignUp() {
//     var state = ref.read(registerNotifierProvider);

//     String name = state.userName;
//     String email = state.email;

//     String password = state.password;
//     String rePassword = state.confirmpassword;

//     print("Your name is $name");
//     print("Your email is $email");
//     print("Your password is $password");
//     print("Your rePassword is $rePassword");

//     if (state.password != state.confirmpassword) {
//       print("your password does not match");
//     }
//   }
// }
