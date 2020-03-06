import 'dart:convert';
import 'dart:io';
import 'data.dart';

main() async {
  var reqServer = await HttpServer.bind('192.168.0.108', 8080);

  print('服务器已启动');
  // 处理请求
  await for (HttpRequest request in reqServer) {
    handleMessage(request);
  }
}

// 请求方式
void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGET(request);
    } else if (request.method == 'POST') {
      handlePOST(request);
    }
  } catch (e) {
    print('请求异常, $e');
  }
}

// get
void handleGET(HttpRequest request) {
  // 获取请求参数
  var action = request.uri.queryParameters['action'];
  if (action == 'getProducts') {
    var page = request.uri.queryParameters['page'];
    print('获取产品数据。。。');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(jsonEncode(products))
      ..close();
  } else if (action == 'getNews') {
    print('获取新闻数据。。。');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(jsonEncode(news))
      ..close();
  } else if (action == 'getConcats') {
    var msg = request.uri.queryParameters['msg'];
    request.response
      ..statusCode = HttpStatus.ok
      ..write('留言发送成功')
      ..close();
  }
}

// post
void handlePOST(HttpRequest request) {}
