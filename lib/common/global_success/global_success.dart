import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'global_success.g.dart';

@riverpod
class AppSuccess extends _$AppSuccess {
  @override
  bool build() {
    return false;
  }

  void setSuccessValue(bool value) {
    state = value;
  }
}

@riverpod
class AppRegisterSuccess extends _$AppRegisterSuccess {
  @override
  bool build() {
    return false;
  }

  void setRegisterSuccessValue(bool value) {
    state = value;
  }
}
