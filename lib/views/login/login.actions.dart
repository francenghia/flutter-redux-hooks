class LoginActions {}

class SetEmailAction extends LoginActions {
  SetEmailAction({required this.email});

  String email;
}

class SetPasswordAction extends LoginActions {
  SetPasswordAction({required this.password});

  String password;
}
