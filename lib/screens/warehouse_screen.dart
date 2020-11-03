import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/models/WareHouse.dart';
import 'package:test_app/services/warehouse_api.dart';
import 'package:test_app/widgets/cus_list_view_warehouse.dart';
import 'package:test_app/widgets/cus_raised_button.dart';

class WareHouseScreen extends StatefulWidget {
  @override
  _WareHouseScreenState createState() => _WareHouseScreenState();
}

class _WareHouseScreenState extends State<WareHouseScreen> {
  // WareHouse Api
  List<WareHouse> _wareHouses = [];

  @override
  void initState() {
    super.initState();
    _getWareHouses();
  }

  @override
  Widget build(BuildContext context) {
    return CusListViewWareHouse(
      wareHouseList: _wareHouses,
    );
  }

  _getWareHouses() {
    WareHouseApi.getWareHouses().then((response) {
      List<dynamic> wareHouses = jsonDecode(response.body);
      // print(wareHouses.toString());
      setState(() {
        this._wareHouses =
            wareHouses.map((warehouse) => WareHouse.toJSON(warehouse)).toList();
      });
      //print(_wareHouses[0].warehouse_name);
    });
  }
}
