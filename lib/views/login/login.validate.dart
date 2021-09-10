import 'package:flutter_redux_hooks/core/base/validation/validation_result.dart';
import 'package:flutter_redux_hooks/core/utils/validate_utils.dart';
import 'package:flutter_redux_hooks/views/login/login.state.dart';
import 'package:flutter_redux_hooks/views/login/login.types.dart';

class LoginValidationResults extends ILoginValidationResults {
  @override
  ValidationResult validateEmail(String email) {
    if (ValidateUtils.isNullEmptyOrWhitespace(email)) {
      return ValidationResult.error("string error");
    }

    if (!ValidateUtils.validateEmail(email)) {
      return ValidationResult.error("format email error");
    }
    return ValidationResult.ok();
  }

  @override
  ValidationResult validatePassword(String password) {
    if (ValidateUtils.isNullEmptyOrWhitespace(password)) {
      return ValidationResult.error("string error");
    }

    return ValidationResult.ok();
  }

  @override
  bool validateForm(LoginState state) {
    final emailValid = validateEmail(state.email).isValid;
    final passwordValid = validatePassword(state.password).isValid;

    return emailValid && passwordValid;
  }
}
