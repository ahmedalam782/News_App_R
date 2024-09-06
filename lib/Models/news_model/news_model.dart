import 'package:collection/collection.dart';

import '../../Shared/network/remote/end_point.dart';
import 'article.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json[ApiKey.status] as String?,
        totalResults: json[ApiKey.totalResults] as int?,
        articles: (json[ApiKey.articles] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
