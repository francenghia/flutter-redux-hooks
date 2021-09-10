import 'package:flutter_redux_hooks/views/login/login.actions.dart';
import 'package:flutter_redux_hooks/views/login/login.state.dart';
import 'package:flutter_redux_hooks/views/login/login.validate.dart';
import 'package:redux/redux.dart';

LoginState loginReducers(LoginState state, LoginActions? action) {
  final appReducer = combineReducers<LoginState>([
    TypedReducer<LoginState, SetEmailAction>(_setEmailChange),
    TypedReducer<LoginState, SetPasswordAction>(_setPasswordChange),
  ]);

  return appReducer.call(state, action);
}

LoginState _setEmailChange(LoginState state, SetEmailAction action) {
  final newState = state.clone();
  final emailError =
      LoginValidationResults().validateEmail(action.email).errorMessage;

  newState
    ..email = action.email
    ..emailError = emailError;
  return newState;
}

LoginState _setPasswordChange(LoginState state, SetPasswordAction action) {
  final newState = state.clone();

  final passwordError =
      LoginValidationResults().validatePassword(action.password).errorMessage;

  newState
    ..password = action.password
    ..passwordError = passwordError;
  return newState;
}
