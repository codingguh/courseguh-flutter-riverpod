class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String confirmpassword;

  RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.confirmpassword = "",
  });

  RegisterState copyWith(
      {String? userName,
      String? email,
      String? password,
      String? confirmpassword}) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
    );
  }
}
