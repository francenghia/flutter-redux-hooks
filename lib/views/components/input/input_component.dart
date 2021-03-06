import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputComponent extends HookWidget {
  const InputComponent(
      {required this.labelTitleInput,
      required this.keyboardType,
      required this.isFieldPassword,
      required this.labelHint,
      required this.onChanged,
      this.initialValue,
      this.customController,
      this.errorText});

  final String labelTitleInput;
  final TextInputType keyboardType;
  final bool isFieldPassword;
  final String labelHint;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? customController;
  final Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              border: OutlineInputBorder(),
              hintText: labelHint,
              labelText: labelTitleInput,
              errorText: errorText,
              hintStyle: TextStyle(color: Colors.grey),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: keyboardType,
            obscureText: isFieldPassword,
            controller: customController,
            style: TextStyle(color: Colors.black)));
  }
}
