import 'package:flutter/material.dart';
import 'package:news_app_route/news/data/models/article.dart';
import 'package:news_app_route/news/repository/news_repository.dart';

import '../../Shared/service_locator.dart';

class NewsViewModel extends ChangeNotifier {
  final repository = NewsRepository(ServiceLocator.newsData);
  List<Article> article = [];
  String? errorMessage;
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;
  bool isLoadingPagination = false;

  Future<void> getNews(
    String sourceId,
    String q, {
    bool isLoadingFromPagination = false,
  }) async {
    if (isLoadingFromPagination) {
      isLoadingPagination = isLoadingFromPagination;
      notifyListeners();
    } else {
      isLoading = true;
      article = [];
      page = 1;
      errorMessage = null;
      notifyListeners();
    }
    try {
      if (await repository.getNews(sourceId, q, page) == []) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
      } else {
        article.addAll(await repository.getNews(sourceId, q, page));
        isLoadingPagination = false;
        hasMore = true;
        page++;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
