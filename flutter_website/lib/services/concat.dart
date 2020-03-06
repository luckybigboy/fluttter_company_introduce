import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_website/conf/config.dart';

// 留言
getConcat(String msg) async {
  String url = 'http://' +
      Config.ip +
      ':' +
      Config.port +
      '/?action=getConcats&msg=$msg';
  var res = await http.get(url);
  String body = res.body;
  var json = body;
  print(json);
  return json;
}
