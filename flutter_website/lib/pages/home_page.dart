import 'package:flutter/material.dart';
import 'package:flutter_website/pages/home_banner_page.dart';
import 'package:flutter_website/model/product.dart';
import 'package:flutter_website/pages/home_product_page.dart';
import 'package:flutter_website/services/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductListModel listData = ProductListModel([]);
  @override
  void _getProductList() async {
    var data = await getProducts();
    ProductListModel list = ProductListModel.fromjson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    _getProductList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[HomeBannerPage(), HomeProductPage(listData)],
      ),
    );
  }
}
