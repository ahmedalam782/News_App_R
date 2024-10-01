import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/news/data/models/article.dart';
import 'package:news_app_route/news/repository/news_repository.dart';
import 'package:news_app_route/news/view_model/news_states.dart';

import '../../Shared/service_locator.dart';

class NewsCubitViewModel extends Cubit<NewsStates> {
  late final NewsRepository repository;

  NewsCubitViewModel() : super(NewsInitialState()) {
    repository = NewsRepository(ServiceLocator.newsData);
  }

  static NewsCubitViewModel get(context) => BlocProvider.of(context);
  int page = 1;
  List<Article> news = [];
  bool hasMore = false;

  Future<void> getNews(
    String sourceId,
    String q, {
    bool isLoadingFromPagination = false,
  }) async {
    if (isLoadingFromPagination) {
      emit(NewsPaginationState());
    } else {
      page = 1;
      news = [];
      emit(NewsLoadingState());
    }
    try {
      var article = await repository.getNews(sourceId, q, page);
      if (article.isNotEmpty) {
        if (article.length < 5) {
          hasMore = false;
        } else {
          hasMore = true;
        }
        news.addAll(article);
        page++;
      } else {
        page = 1;
        article = [];
        hasMore = false;
      }
      emit(NewsSuccessState(news: news));
    } catch (e) {
      emit(NewsFailureState(errorMessage: e.toString()));
    }
  }
}
