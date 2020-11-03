import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/Product.dart';
import 'package:test_app/services/product_api.dart';
import 'package:test_app/widgets/cus_list_view_product.dart';
import 'package:test_app/widgets/cus_raised_button.dart';

class ProductScreen extends StatefulWidget {
  static const String id = '/product_screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // coming from product api
  List<Product> _productList = List<Product>();

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return CusListViewProduct(productList: _productList);
  }

  void _getProductList() {
    // TODO: if page open, get all Products
    ProductApi.getProductList().then((response) {
      Map products = jsonDecode(response.body);
      Iterable productList = products['data'];
      setState(() {
        this._productList =
            productList.map((product) => Product.fromJSON(product)).toList();
      });
      // print('Ürün listesi ' + products.toString());
      // print('Ürün listesi ' + _productList[0].productName);
      // print('Ürün sayısı ' + _productList.length.toString());
    });
  }
}
