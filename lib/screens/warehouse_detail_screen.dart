import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/services/warehouse_api.dart';
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
      ],
    );
  }

  void _getWareHouseDetails() {
    String wareHouseId = widget.wareHouseId;
    WareHouseApi.getWareHouseDetails(wareHouseId).then((response) {
      List<dynamic> wareHouseDetailList = jsonDecode(response.body);
      //print(wareHouseDetailList.toString());
    });
  }
}
