import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/services/login_api.dart';
import 'package:test_app/widgets/cus_text_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Coflow App',
      debugShowCheckedModeBanner: false,
      home: MyAppScaffold(),
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
    // TODO: if login button clicked operations
    String userName = _userNameTextController.text;
    String userPassword = _userPasswordTextController.text;
    LoginApi.userLogin(userName, userPassword).then((response) {
      Map returnMessage = jsonDecode(response.body);
      _userLoginControl(returnMessage);
    });
  }

  void _userLoginControl(Map returnMessage) {
    if (returnMessage['result'] == 1) {
      print('Login OK');
    } else {
      print('Login not OK');
    }
  }
}
