import 'package:flutter/material.dart';
import 'package:flutter_website/model/product.dart';
import 'package:flutter_website/pages/product_list_page.dart';
import 'package:flutter_website/services/product.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductListModel listData = ProductListModel([]);
  int page = 0;
  void _getProduct() async {
    var data = await getProducts(page++);
    ProductListModel list = ProductListModel.fromjson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    _getProduct();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ProductListPage(listData, getNextPage: () => _getProduct());
  }
}
