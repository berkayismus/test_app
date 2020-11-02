import 'package:flutter/material.dart';
import 'package:test_app/models/Product.dart';

class CusListViewProduct extends StatelessWidget {
  final List<Product> productList;

  CusListViewProduct({this.productList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(productList[index].name),
                trailing: Text(
                  'ID ${productList[index].id}',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text('Name ${productList[index].productName}'),
                subtitle:
                    Text('Created at \n${productList[index].productName}'),
              ),
            ),
          );
        });
  }
}
