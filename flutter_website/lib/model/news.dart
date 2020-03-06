class NewsItemModel {
  String author;
  String title;
  String content;
  NewsItemModel({this.author, this.title, this.content});
  factory NewsItemModel.fromjson(dynamic json) {
    return NewsItemModel(
        author: json['author'], title: json['title'], content: json["content"]);
  }
}

class NewsListModel {
  List<NewsItemModel> data;
  NewsListModel(this.data);
  factory NewsListModel.fromjson(List json) {
    return NewsListModel(
        json.map((item) => NewsItemModel.fromjson(item)).toList());
  }
}
