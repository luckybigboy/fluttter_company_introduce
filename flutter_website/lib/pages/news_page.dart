import 'package:flutter/material.dart';
import 'package:flutter_website/model/news.dart';
import 'package:flutter_website/pages/news_details_page.dart';
import 'package:flutter_website/services/news.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsListModel listData = NewsListModel([]);
  void _getNewsData() async {
    var data = await getNews();
    NewsListModel list = NewsListModel.fromjson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    _getNewsData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            NewsItemModel item = listData.data[index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.content),
              leading: Icon(Icons.fiber_new),
              trailing: Icon(Icons.arrow_forward),
              contentPadding: EdgeInsets.all(10.0),
              enabled: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetailsPage(item: item)));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1.0,
                color: Colors.grey,
              ),
          itemCount: listData.data.length),
    );
  }
}
