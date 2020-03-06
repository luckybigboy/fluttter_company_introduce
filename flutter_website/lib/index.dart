import 'package:flutter/material.dart';

// page
import 'package:flutter_website/pages/home_page.dart';
import 'package:flutter_website/pages/product_page.dart';
import 'package:flutter_website/pages/news_page.dart';
import 'package:flutter_website/pages/about_us_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  HomePage homePage;
  ProductPage productPage;
  NewsPage newsPage;
  AboutUsPage aboutUsPage;

  _currentPage() {
    switch (_currentIndex) {
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
        break;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
        break;
      case 2:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
        break;
      case 3:
        if (aboutUsPage == null) {
          aboutUsPage = AboutUsPage();
        }
        return aboutUsPage;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页面'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: _currentPage(),
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('产品')),
            BottomNavigationBarItem(
                icon: Icon(Icons.fiber_new), title: Text('新闻')),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_comment), title: Text('关于我们'))
          ]),
    );
  }
}
