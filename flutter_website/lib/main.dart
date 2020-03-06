import 'package:flutter/material.dart';
import 'package:flutter_website/index.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_website/loading.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'company introduce',
    // 自定义主题
    theme: mDefaultTheme,
    // 添加路由
    routes: <String, WidgetBuilder>{
      "index": (BuildContext context) => IndexPage(),
      "company_info": (BuildContext context) => WebviewScaffold(
          url: 'https://www.baidu.com',
          appBar: AppBar(
              title: Text('公司简介'),
              leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // 路由到主页面
                  Navigator.of(context).pushReplacementNamed('index');
                },
              )))
    },
    // 指定加载页面
    home: Loading()));

// 自定义主题
final ThemeData mDefaultTheme = ThemeData(primaryColor: Colors.redAccent);
