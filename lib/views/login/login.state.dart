import 'package:flutter_redux_hooks/core/base/redux-generator/type_base.dart';

class LoginState implements StateCloneable<LoginState> {
  String email = '';
  String? emailError;
  String password = '';
  String? passwordError;

  @override
  LoginState clone() {
    return LoginState()
      ..email = email
      ..emailError = emailError
      ..password = password
      ..passwordError = passwordError;
  }
}

LoginState initState() {
  return LoginState();
}
