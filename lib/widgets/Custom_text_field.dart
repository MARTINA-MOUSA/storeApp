import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, this.onChanged, this.hintText, this.obscureText = false,this.inputType});

  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,

        //speffic not control it
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        // general
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
