import 'package:courseguh/common/entities/user.dart';
import 'package:courseguh/common/global_loader/global_loader.dart';
import 'package:courseguh/common/utils/constants.dart';
import 'package:courseguh/common/widgets/popup_messages.dart';
import 'package:courseguh/global.dart';
import 'package:courseguh/screens/sign_in/notifier/sign_in_notifier.dart';
import 'package:courseguh/screens/sign_in/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInController {
  WidgetRef ref;
  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(BuildContext context) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty", context: context);
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty", context: context);
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo("User not found",
            context: context, backgroundColor: Colors.red);
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email address first !",
            backgroundColor: Colors.red, context: context);
        return;
      }
      var user = credential.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity, context);
        print('user loged in');
        if (kDebugMode) {
          print("user logged in");
        }
      } else {
        toastInfo("login error", context: context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        toastInfo("User not found",
            context: context, backgroundColor: Colors.red);
      } else if (e.code == 'invalid-credential') {
        toastInfo("Email or password is wrong",
            context: context, backgroundColor: Colors.red);
      }
      print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(
      LoginRequestEntity loginRequestEntity, BuildContext context) {
    //we need to talk to server

    //have local storage
    try {
      var navigator = Navigator.of(ref.context);
      //try to remember user info
      Global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, "123");
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

      navigator.pushNamedAndRemoveUntil('/dashboard', (route) => false);
      // navigator.push(MaterialPageRoute(
      //     builder: (BuildContext context) =>
      //         Scaffold(appBar: AppBar(), body: Dashboard())));

      //navigator.pushNamed("/dashboard");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //redirect to new page
  }
}
