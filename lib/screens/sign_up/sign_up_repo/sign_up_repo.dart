import 'package:courseguh/common/models/user.dart';
import 'package:courseguh/common/services/http_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  static Future<UserCredential> firebaseSignUp(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return credential;
  }

  static Future<UserLoginResponseEntity> login(
      {LoginRequestEntity? params}) async {
    var response =
        await HttpUtil().post("api/login", queryParameters: params?.toJson());

    return UserLoginResponseEntity.fromJson(response);
  }
}
