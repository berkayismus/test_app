import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/models/WareHouse.dart';

import 'constants.dart';

class CusListViewWareHouse extends StatelessWidget {
  final List<WareHouse> wareHouseList;

  CusListViewWareHouse({this.wareHouseList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: wareHouseList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () => Navigator.pushNamed(
                    context, '/warehouse_detail/${wareHouseList[index].id}'),
                leading: Icon(FontAwesomeIcons.warehouse),
                trailing: Text(
                  'ID ${wareHouseList[index].id}',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text(
                  'Warehouse Name ${wareHouseList[index].warehouse_name}',
                  style: kListTitleTextStyle,
                ),
                subtitle: Text('Language \n${wareHouseList[index].language}'),
              ),
            ),
          );
        });
  }
}

/*
*  String id;
  String warehouse_name;
  String language;
  String ref_id;
  String status;*/
