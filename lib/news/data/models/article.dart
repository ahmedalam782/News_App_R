import 'package:news_app_route/Shared/network/remote/end_point.dart';
import 'package:news_app_route/news/data/models/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json[ApiKey.source] == null
            ? null
            : Source.fromJson(json[ApiKey.source] as Map<String, dynamic>),
        author: json[ApiKey.author] as String?,
        title: json[ApiKey.title] as String?,
        description: json[ApiKey.description] as String?,
        url: json[ApiKey.url] as String?,
        urlToImage: json[ApiKey.urlToImage] as String?,
        publishedAt: json[ApiKey.publishedAt] == null
            ? null
            : DateTime.parse(json[ApiKey.publishedAt] as String),
        content: json[ApiKey.content] as String?,
      );
}
