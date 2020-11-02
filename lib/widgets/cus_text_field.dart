import 'package:flutter/material.dart';

class CusTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPasswordInput;
  final String labelText;
  final String hintText;

  // constructor with named parameter
  CusTextField(
      {@required this.textEditingController,
      @required this.isPasswordInput,
      this.hintText,
      @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: textEditingController,
        obscureText: isPasswordInput ?? false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
