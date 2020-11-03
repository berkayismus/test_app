import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_app/models/WareHouse.dart';
import 'package:test_app/services/warehouse_api.dart';
import 'package:test_app/widgets/cus_raised_button.dart';
import 'package:test_app/widgets/cus_text_field.dart';

class WareHouseDetailScreen extends StatefulWidget {
  // warehouse ID for warehouse Details
  String wareHouseId = '0';
  WareHouseDetailScreen(this.wareHouseId);

  @override
  _WareHouseDetailScreenState createState() => _WareHouseDetailScreenState();
}

class _WareHouseDetailScreenState extends State<WareHouseDetailScreen> {
  // controllers
  TextEditingController _wareHouseNameController;
  TextEditingController _wareHouseStatusController;

  // lists
  List<WareHouse> _warehouseList = [];

  @override
  void initState() {
    _wareHouseNameController = TextEditingController();
    _wareHouseStatusController = TextEditingController();
    _getWareHouseDetails();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _wareHouseNameController.dispose();
    _wareHouseStatusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WareHouse Details'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CusTextField(
                textEditingController: _wareHouseNameController,
                isPasswordInput: false,
                hintText: 'Enter warehouse name',
                labelText: 'Warehouse Name',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CusTextField(
                textEditingController: _wareHouseStatusController,
                isPasswordInput: false,
                hintText: 'Enter warehouse status',
                labelText: 'Warehouse Status',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CusRaisedButton(
                buttonText: 'UPDATE',
                onPressed: _updateWareHouse,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _getWareHouseDetails() {
    String wareHouseId = widget.wareHouseId;
    WareHouseApi.getWareHouseDetails(wareHouseId).then((response) {
      List<dynamic> wareHouseDetailList = jsonDecode(response.body);
      //print(wareHouseDetailList.toString());
      this._warehouseList = wareHouseDetailList
          .map((warehouse) => WareHouse.toJSON(warehouse))
          .toList();
      //print(_warehouseList[0].warehouse_name);
      _fillInputFields(_warehouseList[0]);
    });
  }

  void _fillInputFields(WareHouse wareHouse) {
    String wareHouseName = wareHouse.warehouse_name;
    String wareHouseStatus = wareHouse.status;
    _wareHouseNameController.text = wareHouseName;
    _wareHouseStatusController.text = wareHouseStatus;
  }

  void _updateWareHouse() {
    String wareHouseName = _wareHouseNameController.text;
    String wareHouseStatus = _wareHouseStatusController.text;
    WareHouseApi.updateWareHouse(
            widget.wareHouseId, wareHouseName, wareHouseStatus)
        .then((response) {
      Map responseBody = jsonDecode(response.body);
      //print('Response gövdesi ' + responseBody.toString());
      int result = responseBody['result'];
      String resultMessage = responseBody['message'];
      _showAlertMessage(result, resultMessage);
    });
  }

  void _showAlertMessage(int result, String resultMessage) {
    Alert(
      context: context,
      type: result == 1 ? AlertType.success : AlertType.error,
      title: "UPDATE",
      desc: resultMessage,
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
