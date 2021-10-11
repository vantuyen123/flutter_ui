import 'package:firebase_email_login/constants/color_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 65,
      color: signUpTextFieldColor,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
