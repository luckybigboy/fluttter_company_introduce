import 'package:flutter/material.dart';
import 'package:flutter_website/pages/about_us_concant.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/3.png',
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(
                '公司简介',
                style: TextStyle(color: Colors.grey),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                '公司优势',
                style: TextStyle(color: Colors.grey),
              ),
              leading: Icon(Icons.info),
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                '联系我们',
                style: TextStyle(color: Colors.grey),
              ),
              leading: Icon(Icons.phone),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutUsConcatPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
