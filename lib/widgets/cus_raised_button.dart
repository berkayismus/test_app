import 'package:flutter/material.dart';

import 'constants.dart';

class CusRaisedButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  CusRaisedButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(buttonText),
        color: kButtonBackColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
