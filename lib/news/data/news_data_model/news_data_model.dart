import 'package:news_app_route/news/data/models/news_model.dart';

import '../../../Shared/network/remote/api_consumer.dart';
import '../../../Shared/network/remote/end_point.dart';
import '../../../Shared/network/remote/http_consumer.dart';

class NewsDataModel {
  ApiConsumer apiConsumer = HttpConsumer();

  Future<NewsModel> getNews(String sourceId, String q, int page) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.topHeadLines, {
      "apiKey": ApiKey.apiKey,
      "sources": sourceId,
      "pageSize": '5',
      "page": page.toString(),
      'q': q,
    });
    final response = await apiConsumer.get(url);
    return NewsModel.fromJson(response);
  }
}
