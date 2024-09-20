import 'package:news_app_route/Shared/service_locator.dart';
import 'package:news_app_route/news/data/models/article.dart';
import 'package:news_app_route/news/data/models/news_model.dart';
import 'package:news_app_route/news/data/news_data_model/news_data.dart';

import '../../../Shared/network/remote/end_point.dart';

class NewsApiData extends NewsData {
  @override
  Future<List<Article>> getNews(String sourceId, String q, int page) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.topHeadLines, {
      "apiKey": ApiKey.apiKey,
      "sources": sourceId,
      "pageSize": '5',
      "page": page.toString(),
      'q': q,
    });
    final response = await ServiceLocator.apiConsumer.get(url);
    NewsModel newsModel = NewsModel.fromJson(response);
    if (newsModel.status == 'ok' || newsModel.articles != null) {
      return newsModel.articles!;
    } else if (newsModel.errorServerModel?.message != null ||
        newsModel.errorServerModel?.status == 'error') {
      throw Exception(newsModel.errorServerModel?.message);
    } else {
      throw Exception('Failed to get News ');
    }
  }
}
