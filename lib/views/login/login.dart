import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/views/components/input/index.dart';
import 'package:flutter_redux_hooks/views/login/login.view_model.dart';

class LoginScreen extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = useLoginViewModel();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        actions: [],
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: MediaQuery.of(context).size.width > 680
            ? EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4,
                right: MediaQuery.of(context).size.width / 4,
                top: 20.0)
            : EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              Text(
                vm.dayOfMonth,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 36.0,
              ),
              const Text(
                "email",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "password",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    InputComponent(
                        onChanged: vm.onEmailChange,
                        labelTitleInput: "Input email",
                        keyboardType: TextInputType.text,
                        isFieldPassword: false,
                        labelHint: "pls input email",
                        errorText: vm.state.emailError ?? null),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputComponent(
                        onChanged: vm.onPasswordChange,
                        labelTitleInput: "Input password",
                        keyboardType: TextInputType.text,
                        isFieldPassword: true,
                        labelHint: "pls input password",
                        errorText: vm.state.passwordError ?? null),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Material(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () => {},
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 50,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Material(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () => {},
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 50,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
