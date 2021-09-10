import 'package:flutter_redux_hooks/core/base/validation/validation_result.dart';
import 'package:flutter_redux_hooks/views/login/login.state.dart';

abstract class ILoginValidationResults<T> {
  bool validateForm(LoginState state);

  ValidationResult validateEmail(String email);

  ValidationResult validatePassword(String password);
}

class UseLoginViewModel {
  UseLoginViewModel({
    required this.state,
    required this.dayOfMonth,
    required this.onEmailChange,
    required this.onPasswordChange,
  });

  LoginState state;
  String dayOfMonth;
  Function(String text) onEmailChange;
  Function(String text) onPasswordChange;
}
