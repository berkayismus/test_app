import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_app/screens/bottom_nav_screen.dart';
import 'package:test_app/screens/product_screen.dart';
import 'package:test_app/screens/warehouse_detail_screen.dart';
import 'package:test_app/services/login_api.dart';
import 'package:test_app/widgets/cus_text_field.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Coflow App',
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreenBody(),
        ProductScreen.id: (context) => ProductScreen(),
        BottomNavScreen.id: (context) => BottomNavScreen()
        //'/warehouse_detail/1': (context) => WareHouseDetailScreen()
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements = settings.name.split('/');
        if (pathElements[1] == 'warehouse_detail') {
          return MaterialPageRoute(
              builder: (context) => WareHouseDetailScreen(pathElements[2]));
        }
      },
    );
  }
}

class MainScreenBody extends StatefulWidget {
  @override
  _MainScreenBodyState createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
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
                      side: BorderSide(color: Colors.red),
                    ),
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
      Navigator.pushNamed(context, ProductScreen.id);
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
