import 'package:flutter/material.dart';
import 'package:flutter_website/model/product.dart';
import 'package:flutter_website/pages/home_productDetail_page.dart';
import 'package:flutter_website/utils/utils.dart';

class HomeProductPage extends StatelessWidget {
  // home页面传的参数
  final ProductListModel list;
  HomeProductPage(this.list);
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width; // 获取设备的逻辑宽度

    // 商品主容器
    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 7.5),
      child: _item(context, deviceWidth),
    );
  }

  Widget _item(context, double deviceWidth) {
    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110 / 360;

    // 单个商品容器集合
    List<Widget> listWidgets = list.data.map((e) {
      Color bgColor = string2Color('#f8f8ff8');
      Color titleColor = string2Color('#db5d41');
      Color subTitleColor = string2Color('#999999');
      return GestureDetector(
          onTap: () {
            // 动态路由
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeProductDetailPage(item: e)));
          },
          child: Container(
            width: itemWidth,
            margin: EdgeInsets.only(bottom: 5, left: 2),
            padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
            color: bgColor,
            child: Column(
              children: <Widget>[
                Text(
                  e.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: titleColor, fontSize: 16.0),
                ),
                Text(
                  e.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: subTitleColor, fontSize: 16.0),
                ),
                Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    e.imgUrl,
                    width: imageWidth,
                    height: imageWidth,
                  ),
                )
              ],
            ),
          ));
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
          child: Text('最新产品',
              style: TextStyle(
                  fontSize: 16.0, color: Color.fromRGBO(51, 51, 51, 1))),
        ),
        // 流式布局
        Wrap(spacing: 2, children: listWidgets)
      ],
    );
  }
}
