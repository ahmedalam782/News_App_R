import 'package:news_app_route/news/data/models/article.dart';
import 'package:news_app_route/news/data/news_data_model/news_data.dart';

class NewsRepository {
  final NewsData newsData;

  NewsRepository(this.newsData);

  Future<List<Article>> getNews(String sourceId, String q, int page) async {
    return await newsData.getNews(sourceId, q, page);
  }
}
