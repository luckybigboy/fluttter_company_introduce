import 'package:flutter/material.dart';
import 'package:flutter_website/model/product.dart';

class HomeProductDetailPage extends StatelessWidget {
  final ProductItemModel item;
  HomeProductDetailPage({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            item.imgUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(item.desc),
          )
        ],
      ),
    );
  }
}
