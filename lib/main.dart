import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_app/screens/main_screen.dart';
import 'package:test_app/services/login_api.dart';
import 'package:test_app/widgets/cus_text_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Coflow App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/main_screen',
      routes: {
        '/': (context) => MyAppScaffold(),
        '/main_screen': (context) => MainScreen()
      },
    );
  }
}

class MyAppScaffold extends StatefulWidget {
  @override
  _MyAppScaffoldState createState() => _MyAppScaffoldState();
}

class _MyAppScaffoldState extends State<MyAppScaffold> {
  // controllers for text
  TextEditingController _userNameTextController;
  TextEditingController _userPasswordTextController;

  // user login api
  Map _returnMessage;

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
    _userPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _userPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App CoFlow'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CusTextField(
                      textEditingController: _userNameTextController,
                      labelText: 'Username',
                      hintText: 'Please enter your username',
                      isPasswordInput: false,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CusTextField(
                      textEditingController: _userPasswordTextController,
                      labelText: 'Password',
                      hintText: 'Please enter your password',
                      isPasswordInput: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: _onLoginPressed,
                    child: Text('LOGIN'),
                    color: Colors.pink,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    String userName = _userNameTextController.text;
    String userPassword = _userPasswordTextController.text;
    LoginApi.userLogin(userName, userPassword).then((response) {
      Map returnMessage = jsonDecode(response.body);
      this._returnMessage = returnMessage;
      _userLoginControl(returnMessage);
    });
  }

  void _userLoginControl(Map returnMessage) {
    if (returnMessage['result'] == 1) {
      // TODO: if login ok, navigate to main page
      Navigator.pop(context);
      Navigator.pushNamed(context, '/main_screen');
    } else {
      // TODO: if login not ok, show a message
      _showAlertMessage();
    }
  }

  void _showAlertMessage() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "LOGIN",
      desc: _returnMessage['message'],
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
