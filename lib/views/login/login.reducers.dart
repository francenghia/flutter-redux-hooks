import 'package:flutter_redux_hooks/views/login/login.actions.dart';
import 'package:flutter_redux_hooks/views/login/login.state.dart';
import 'package:redux/redux.dart';

import 'login.validate.dart';

LoginState loginReducers(LoginState state, LoginActions? action) {
  final appReducer = combineReducers<LoginState>([
    TypedReducer<LoginState, SetEmailAction>(_setEmailChange),
    TypedReducer<LoginState, SetPasswordAction>(_setPasswordChange),
  ]);

  return appReducer.call(state, action);
}

LoginState _setEmailChange(LoginState state, SetEmailAction action) {
  final newState = state.clone();
  String? emailError =
      LoginValidationResults().validateEmail(action.email).errorMessage;

  newState.email = action.email;
  newState.emailError = emailError;
  return newState;
}

LoginState _setPasswordChange(LoginState state, SetPasswordAction action) {
  final newState = state.clone();

  String? passwordError =
      LoginValidationResults().validatePassword(action.password).errorMessage;

  newState.password = action.password;
  newState.passwordError = passwordError;
  return newState;
}
