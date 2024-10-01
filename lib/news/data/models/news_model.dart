import 'package:news_app_route/Shared/Exceptions/Error_Server_Model/error_server_model.dart';

import '../../../Shared/network/remote/end_point.dart';
import 'article.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Article>? articles;
  ErrorServerModel? errorServerModel;

  NewsModel(
      {this.status, this.totalResults, this.articles, this.errorServerModel});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json[ApiKey.status] as String?,
        totalResults: json[ApiKey.totalResults] as int?,
        articles: json[ApiKey.articles] == null
            ? null
            : (json[ApiKey.articles] as List<dynamic>?)
                ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
                .toList(),
        errorServerModel: ErrorServerModel.fromJson(json),
      );
}
