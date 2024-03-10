import 'package:courseguh/common/widgets/popup_messages.dart';
import 'package:courseguh/screens/sign_up/notifier/register_notifier.dart';
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

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty", context: buildContext);
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short",
          context: buildContext, backgroundColor: Color(0XFFFE14D2A));
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

    var context = Navigator.of(ref.context);

    try {
      print("Your name is $name");
      print("Your email is $email");
      print("Your password is $password");
      print("Your name is $name");
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        //get server photo url
        //set user photo url
        toastInfo("Open your email inbox and verify account",
            context: buildContext);
        context.pop();
      }
    } on FirebaseAuthException catch (ex) {
      toastInfo("error occured due to ${ex.code.toString()}",
          context: buildContext);
    }
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
