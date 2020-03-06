import 'package:flutter/material.dart';
import 'package:flutter_website/services/concat.dart';

class AboutUsConcatPage extends StatefulWidget {
  @override
  _AboutUsConcatPageState createState() => _AboutUsConcatPageState();
}

class _AboutUsConcatPageState extends State<AboutUsConcatPage> {
  TextEditingController controller = TextEditingController();
  void commit() {
    if (controller.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请输入留言内容'),
              ));
    } else {
      var msg = getConcat(controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('留言板')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/3.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: 380.0,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: '请留言',
                  labelText: '请留言',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: 220.0,
            height: 48.0,
            child: RaisedButton(
              onPressed: () {
                commit();
              },
              child: Text('给我们留言', style: TextStyle(fontSize: 16.0)),
              color: Theme.of(context)
                  .primaryColor, //Colors.redAccent, // 获取主题颜色， 保持颜色一致
              colorBrightness: Brightness.dark,
              textColor: Colors.white,
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
            ),
          )
        ],
      ),
    );
  }
}
