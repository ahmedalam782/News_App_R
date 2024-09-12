import 'package:flutter/material.dart';
import 'package:news_app_route/news/data/models/article.dart';
import 'package:news_app_route/news/data/news_data_model/news_data_model.dart';

class NewsViewModel extends ChangeNotifier {
  NewsDataModel newsDataModel = NewsDataModel();
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
      final response = await newsDataModel.getNews(sourceId, q, page);
      if (response.totalResults == article.length) {
        hasMore = false;
        page = 1;
        isLoadingPagination = false;
        if (article.isEmpty && response.articles!.isEmpty) {
          errorMessage = 'Failed to get News';
        }
      } else if (response.status == 'ok' || response.articles != null) {
        article.addAll(response.articles!.toList());
        isLoadingPagination = false;
        hasMore = true;
        page++;
      } else if (response.errorServerModel?.message != null ||
          response.errorServerModel?.status == 'error') {
        errorMessage = response.errorServerModel?.message;
      } else {
        errorMessage = 'Failed to get News';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
