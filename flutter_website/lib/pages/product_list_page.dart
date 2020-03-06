import 'package:flutter/material.dart';
import 'package:flutter_website/model/product.dart';
import 'package:flutter_website/pages/home_productDetail_page.dart';
import 'package:flutter_website/style/font.dart';
// import 'package:flutter_website/style/color.dart';
import '../style/color.dart';

class ProductListPage extends StatelessWidget {
  // 列表数据
  final ProductListModel list;
  // 获取下一页数据
  final VoidCallback getNextPage;
  ProductListPage(this.list, {this.getNextPage});
  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        // 列表项加载
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0), // 水平填充
            itemCount: list.data.length,
            itemBuilder: (BuildContext context, int index) {
              ProductItemModel item = list.data[index];
              // 加载一页
              if ((index + 4) == list.data.length) {
                getNextPage();
              }
              return GestureDetector(
                onTap: () {
                  // 动态路由
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeProductDetailPage(item: item)));
                },
                child: Container(
                  color: productColors.bgColor,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        item.imgUrl,
                        width: 120.0,
                        height: 120.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: productColors.divideLineColor))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Text(item.type,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: productColors.typeColor)),
                                item.point == null
                                    ? SizedBox(
                                        width: 5.0,
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(left: 5.0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.0,
                                                color:
                                                    productColors.pointColor)),
                                        child: Text(
                                          item.point,
                                          style: TextStyle(
                                              color: productColors.pointColor),
                                        ),
                                      ),
                                Text(
                                  item.name,
                                  style: ProductsFonts.itemNameStyle,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            });
  }
}
