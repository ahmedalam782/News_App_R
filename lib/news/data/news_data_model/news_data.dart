import 'package:news_app_route/news/data/models/article.dart';

abstract class NewsData {
  Future<List<Article>> getNews(String sourceId, String q, int page);
}
