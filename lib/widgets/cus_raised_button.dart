import 'package:flutter/material.dart';

class CusRaisedButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  CusRaisedButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(buttonText),
      color: Colors.pink,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.red),
      ),
    );
  }
}
