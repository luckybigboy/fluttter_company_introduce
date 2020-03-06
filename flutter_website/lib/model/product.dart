// 产品列表单项数据转换
class ProductItemModel {
  String desc;
  String imgUrl;
  String type;
  String name;
  String point;
  ProductItemModel({this.desc, this.imgUrl, this.type, this.name, this.point});
  factory ProductItemModel.fromjson(dynamic json) {
    return ProductItemModel(
        desc: json['desc'],
        imgUrl: json['imgUrl'],
        type: json['type'],
        name: json['name'],
        point: json['point']);
  }
}

// 产品列表数据转换
class ProductListModel {
  List<ProductItemModel> data;
  ProductListModel(this.data);
  factory ProductListModel.fromjson(List json) {
    return ProductListModel(
        json.map((i) => ProductItemModel.fromjson(i)).toList());
  }
}
