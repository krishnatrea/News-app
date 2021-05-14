import 'dart:math';

List<News> jasontoListNewsConverter(Map<String, dynamic> map) {
  List<News> allnews = [];
  map["articles"].forEach((element) {
    News news = News.fromMap(element);
    if (news.urltoimage != null && news.url != null) allnews.add(news);
  });

  return allnews;
}

class News {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urltoimage;
  final String publishAt;
  final String content;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urltoimage,
      this.publishAt,
      this.content});

  factory News.fromMap(Map map) {
    return News(
      author: map["author"],
      title: map["title"],
      content: map["content"],
      description: map["description"],
      publishAt: map["publishedAt"],
      url: map["url"],
      urltoimage: map["urlToImage"],
    );
  }
}
