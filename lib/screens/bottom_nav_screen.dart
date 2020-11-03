import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/main.dart';
import 'package:test_app/screens/product_screen.dart';
import 'package:test_app/screens/warehouse_screen.dart';

import 'company_screen.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key key}) : super(key: key);

  static const String id = '/bottom_nav_screen';

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    ProductScreen(),
    WareHouseScreen(),
    CompanyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        actions: _getAppBarButtons(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.couch),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.warehouse),
            label: 'WareHouses',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.building),
            label: 'Company',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  String _getAppBarTitle() {
    if (_selectedIndex == 0) {
      return 'Products';
    } else if (_selectedIndex == 1) {
      return 'WareHouses';
    } else {
      return 'About Company';
    }
  }

  List<IconButton> _getAppBarButtons() {
    List<IconButton> _iconButtons = [];
    if (_selectedIndex == 0) {
      _iconButtons.add(IconButton(
        icon: Icon(FontAwesomeIcons.powerOff),
        onPressed: _logOutButtonPressed,
        color: Colors.white,
      ));
    }
    return _iconButtons;
  }

  void _logOutButtonPressed() {
    Navigator.pop(context);
    Navigator.pushNamed(context, MainScreen.id);
  }
}
