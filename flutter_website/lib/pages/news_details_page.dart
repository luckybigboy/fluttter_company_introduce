import 'package:flutter/material.dart';
import 'package:flutter_website/model/news.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsItemModel item;
  NewsDetailsPage({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(item.content),
      ),
    );
  }
}
