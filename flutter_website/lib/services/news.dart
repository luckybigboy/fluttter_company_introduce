import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_website/conf/config.dart';

getNews() async {
  String url = 'http://' + Config.ip + ':' + Config.port + '/?action=getNews';
  var res = await http.get(url);
  String body = res.body;
  var json = jsonDecode(body);
  print(json);
  return json['items'] as List;
}
